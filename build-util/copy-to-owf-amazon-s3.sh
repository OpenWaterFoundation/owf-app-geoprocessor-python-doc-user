#!/bin/sh
(set -o igncr) 2>/dev/null && set -o igncr; # This comment is required.
# The above line ensures that the script can be run on Cygwin/Linux even with Windows CRNL.
#
# Copy the site/* contents to the software.openwaterfoundation.org website:
# - replace all the files on the web with local files
# - must specify Amazon profile as argument to the script

# Supporting functions, alphabetized.

# Make sure the MkDocs version is consistent with the documentation content:
# - require that at least version 1.0 is used because of use_directory_urls = True default
# - must use "file.md" in internal links whereas previously "file" would work
# - it is not totally clear whether version 1 is needed but try this out to see if it helps avoid broken links
checkMkdocsVersion() {
  # Required MkDocs version is at least 1.
  requiredMajorVersion="1"
  # On Cygwin, mkdocs --version gives:  mkdocs, version 1.0.4 from /usr/lib/python3.6/site-packages/mkdocs (Python 3.6)
  # On Debian Linux, similar to Cygwin:  mkdocs, version 0.17.3
  # On newer windows: MkDocs --version:  python -m mkdocs, version 1.3.1 from C:\Users\steve\AppData\Local\Programs\Python\Python310\lib\site-packages\mkdocs (Python 3.10)
  # The following should work for any version after a comma.
  mkdocsVersionFull=$(${mkdocsExe} --version | sed -e 's/.*, \(version .*\)/\1/g' | cut -d ' ' -f 2)
  echo "MkDocs --version:  ${mkdocsVersionFull}"
  mkdocsVersion=$(echo "${mkdocsVersionFull}" | cut -d ' ' -f 3)
  echo "MkDocs full version number:  ${mkdocsVersion}"
  mkdocsMajorVersion=$(echo "${mkdocsVersion}" | cut -d '.' -f 1)
  echo "MkDocs major version number:  ${mkdocsMajorVersion}"
  if [ "${mkdocsMajorVersion}" -lt ${requiredMajorVersion} ]; then
    echo ""
    echo "MkDocs version for this documentation must be version ${requiredMajorVersion} or later."
    echo "MkDocs mersion that is found is ${mkdocsMajorVersion}, from full version ${mkdocsVersion}."
    exit 1
  else
    echo ""
    echo "MkDocs major version (${mkdocsMajorVersion}) is OK for this documentation."
  fi
}

# Determine the operating system that is running the script:
# - mainly care whether Cygwin or MINGW
checkOperatingSystem() {
  if [ -n "${operatingSystem}" ]; then
    # Have already checked operating system so return.
    return
  fi
  operatingSystem="unknown"
  os=$(uname | tr '[:lower:]' '[:upper:]')
  case "${os}" in
    CYGWIN*)
      operatingSystem="cygwin"
      ;;
    LINUX*)
      operatingSystem="linux"
      ;;
    MINGW*)
      operatingSystem="mingw"
      ;;
  esac
}

# Check the source files for issues
# - the main issue is internal links need to use [](file.md), not [](file)
checkSourceDocs() {
  # Currently don't do anything but could check the above
  # Need one line to not cause an error
  :
}

# Determine which echo to use, needs to support -e to output colored text
# - normally built-in shell echo is OK, but on Debian Linux dash is used, and it does not support -e
configureEcho() {
  echo2='echo -e'
  testEcho=$(echo -e test)
  if [ "${testEcho}" = '-e test' ]; then
    # The -e option did not work as intended:
    # -using the normal /bin/echo should work
    # -printf is also an option
    echo2='/bin/echo -e'
    # The following does not seem to work
    #echo2='printf'
  fi

  # Strings to change colors on output, to make it easier to indicate when actions are needed
  # - Colors in Git Bash:  https://stackoverflow.com/questions/21243172/how-to-change-rgb-colors-in-git-bash-for-windows
  # - Useful info:  http://webhome.csc.uvic.ca/~sae/seng265/fall04/tips/s265s047-tips/bash-using-colors.html
  # - See colors:  https://en.wikipedia.org/wiki/ANSI_escape_code#Unix-like_systems
  # - Set the background to black to eensure that white background window will clearly show colors contrasting on black.
  # - Yellow "33" in Linux can show as brown, see:  https://unix.stackexchange.com/questions/192660/yellow-appears-as-brown-in-konsole
  # - Tried to use RGB but could not get it to work - for now live with "yellow" as it is
  warnColor='\e[1;40;93m' # user needs to do something, 40=background black, 33=yellow, 93=bright yellow
  errorColor='\e[0;40;31m' # serious issue, 40=background black, 31=red
  menuColor='\e[1;40;36m' # menu highlight 40=background black, 36=light cyan
  okColor='\e[1;40;32m' # status is good, 40=background black, 32=green
  endColor='\e[0m' # To switch back to default color
}

# Echo a string to standard error (stderr).
# This is done so that TSTool results output printed to stdout is not mixed with stderr.
# For example, TSTool may be run headless on a server to output to CGI,
# where stdout formatting is important.
echoStderr() {
  ${echo2} "$@" >&2
}

# Get the CloudFront distribution ID from the bucket so the ID is not hard-coded.
# The distribution ID is echoed and can be assigned to a variable.
# The output is similar to the following (obfuscated here):
# ITEMS   arn:aws:cloudfront::123456789000:distribution/ABCDEFGHIJKLMN    software.openwaterfoundation.org   123456789abcde.cloudfront.net   True    HTTP2   ABCDEFGHIJKLMN  True    2022-01-05T23:29:28.127000+00:00        PriceClass_100  Deployed
getCloudFrontDistribution() {
  local cloudFrontDistributionId subdomain
  subdomain="software.openwaterfoundation.org"
  cloudFrontDistributionId=$(${awsExe} cloudfront list-distributions --output text --profile "${awsProfile}" | grep ${subdomain} | grep "arn:" | awk '{print $2}' | cut -d ':' -f 6 | cut -d '/' -f 2)
  echo ${cloudFrontDistributionId}
}

# Get the version of the GeoProcessor software:
# - get from the source file
getVersion() {
  #local gitRepoFolder, gpRepoFolder, repoFolder, srcFolder
  #local majorVersion, microVersion, minorVersion, modVersion

  # repoFolder should be: '/.../owf-app-geoprocessor-doc-user'
  repoFolder=$(dirname ${scriptFolder})
  # gitReposFolder should be: '/.../git-repos'
  gitReposFolder=$(dirname ${repoFolder})
  # gpRepoFolder should be: '/.../owf-app-geoprocessor-python'
  gpRepoFolder="${gitReposFolder}/owf-app-geoprocessor-python"
  srcFolder="${gpRepoFolder}/src/geoprocessor/app"
  versionFile="${srcFolder}/version.py"
  if [ -f "${versionFile}" ]; then
    echo "Getting version from:  ${versionFile}"
  else
    echo "Version folder does not exist:  ${versionFile}"
    exit 1
  fi
  # Get the version parts because full version string is not a literal in code.
  # The code lines look like:
  #
  #   app_version_major = 1
  #   app_version_minor = 6
  #   app_version_micro = 0
  #   app_version_mod = "dev1"
  #
  majorVersion=$(grep -m 1 app_version_major ${versionFile} | grep -v str | cut -d '=' -f 2 | tr -d " " | tr -d '"')
  minorVersion=$(grep -m 1 app_version_minor ${versionFile} | grep -v str | cut -d '=' -f 2 | tr -d " " | tr -d '"')
  microVersion=$(grep -m 1 app_version_micro ${versionFile} | grep -v str | cut -d '=' -f 2 | tr -d " " | tr -d '"')
  modVersion=$(grep -m 1 app_version_mod ${versionFile} | grep -v str | cut -d '=' -f 2 | tr -d " " | tr -d '"')
  # Form the version from the parts, will be globally visible.
  if [ -z "${modVersion}" -o "${modVersion}" == "" ]; then
    version="${majorVersion}.${minorVersion}.${microVersion}"
  else
    version="${majorVersion}.${minorVersion}.${microVersion}.${modVersion}"
  fi
  echo "Determined version=${version}"
}

# Invalidate a CloudFront distribution for files:
# - first parameter is the CloudFront distribution ID
# - second parameter is the CloudFront folder.
# - ${awsProfile} must be set in global data
invalidateCloudFront() {
  local errorCode cloudFrontDistributionId cloudFrontFolder
  if [ -z "$1" ]; then
    logError "CloudFront distribution ID is not specified.  Script error."
    return 1
  fi
  if [ -z "$2" ]; then
    logError "CloudFront folder is not specified.  Script error."
    return 1
  fi
  # Check global data.
  if [ -z "${awsProfile}" ]; then
    logError "'awsProfile' is not set.  Script error."
    exit 1
  fi
  cloudFrontDistributionId=$1
  cloudFrontFolder=$2
  tmpFile=$(mktemp)

  # Invalidate for CloudFront so that new version will be displayed:
  # - see:  https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Invalidation.html
  # - TODO smalers 2020-04-13 for some reason invalidating /index.html does not work, have to do /index.html*
  echo "Invalidating files so CloudFront will make new version available..."
  if [ "${operatingSystem}" = "mingw" ]; then
    # The following is needed to avoid MinGW mangling the paths, just in case a path without * is used:
    # - tried to use a variable for the prefix but that did not work
    MSYS_NO_PATHCONV=1 ${awsExe} cloudfront create-invalidation --distribution-id "${cloudFrontDistributionId}" --paths "${cloudFrontFolder}" "${cloudFrontFolder}/" --output json --profile "${awsProfile}" | tee ${tmpFile}
  else
    ${awsExe} cloudfront create-invalidation --distribution-id "${cloudFrontDistributionId}" --paths "${cloudFrontFolder}" "${cloudFrontFolder}/" --output json --profile "${awsProfile}" | tee ${tmpFile}
  fi
  errorCode=${PIPESTATUS[0]}
  if [ ${errorCode} -ne 0 ]; then
    logError " "
    logError "Error invalidating CloudFront file(s)."
    exit 1
  else
    logInfo "Success invalidating CloudFront file(s)."
    invalidationId=$(cat ${tmpFile} | grep '"Id":' | cut -d ':' -f 2 | tr -d ' ' | tr -d '"' | tr -d ',')
    # Wait on the invalidation.
    waitOnInvalidation ${cloudFrontDistributionId} ${invalidationId}
  fi

  return ${errorCode}
}

# Print a DEBUG message, currently prints to stderr.
logDebug() {
   echoStderr "[DEBUG] $@"
}

# Print an ERROR message, currently prints to stderr.
logError() {
   echoStderr "[ERROR] $@"
}

# Print an INFO message, currently prints to stderr.
logInfo() {
   echoStderr "[INFO] $@"
}

# Print an WARNING message, currently prints to stderr.
logWarning() {
   echoStderr "[WARNING] $@"
}

# Set the AWS executable:
# - handle different operating systems
# - for AWS CLI V2, can call an executable
# - for AWS CLI V1, have to deal with Python
# - once set, use ${awsExe} as the command to run, followed by necessary command parameters
setAwsExe() {
  if [ "${operatingSystem}" = "mingw" ]; then
    # "mingw" is Git Bash:
    # - the following should work for V2
    # - if "aws" is in path, use it
    awsExe=$(command -v aws)
    if [ -n "${awsExe}" ]; then
      # Found aws in the PATH.
      awsExe="aws"
    else
      # Might be older V1.
      # Figure out the Python installation path.
      pythonExePath=$(py -c "import sys; print(sys.executable)")
      if [ -n "${pythonExePath}" ]; then
        # Path will be something like:  C:\Users\sam\AppData\Local\Programs\Python\Python37\python.exe
        # - so strip off the exe and substitute Scripts
        # - convert the path to posix first
        pythonExePathPosix="/$(echo "${pythonExePath}" | sed 's/\\/\//g' | sed 's/://')"
        pythonScriptsFolder="$(dirname "${pythonExePathPosix}")/Scripts"
        echo "${pythonScriptsFolder}"
        awsExe="${pythonScriptsFolder}/aws"
      else
        echo "[ERROR] Unable to find Python installation location to find 'aws' script"
        echo "[ERROR] Make sure Python 3.x is installed on Windows so 'py' is available in PATH"
        exit 1
      fi
    fi
  else
    # For other Linux, including Cygwin, just try to run.
    awsExe="aws"
  fi
}

# Set the MkDocs executable to use, depending operating system and PATH:
# - sets the global ${mkdocsExe} variable
# - return 0 if the executable is found, exit with 1 if not
setMkDocsExe() {
  if [ "${operatingSystem}" = "cygwin" ] || [ "${operatingSystem}" = "linux" ]; then
    # Is usually in the PATH.
    mkdocsExe="mkdocs"
    if hash py 2>/dev/null; then
      echo "mkdocs is not found (not in PATH)."
      exit 1
    fi
  elif [ "${operatingSystem}" = "mingw" ]; then
    # This is used by Git Bash:
    # - calling 'hash' is a way to determine if the executable is in the path
    if hash py 2>/dev/null; then
      mkdocsExe="py -m mkdocs"
    else
      # Try adding the Windows folder to the PATH and rerun:
      # - not sure why C:\Windows is not in the path in the first place
      PATH=/C/Windows:${PATH}
      if hash py 2>/dev/null; then
        mkdocsExe="py -m mkdocs"
      else
        echo 'mkdocs is not found in C:\Windows.'
        exit 1
      fi
    fi
  fi
  return 0
}

# Wait on an invalidation until it is complete:
# - first parameter is the CloudFront distribution ID
# - second parameter is the CloudFront invalidation ID
waitOnInvalidation () {
  local distributionId invalidationId output totalTime
  local inProgressCount totalTime waitSeconds

  distributionId=$1
  invalidationId=$2
  if [ -z "${distributionId}" ]; then
    logError "No distribution ID provided."
    return 1
  fi
  if [ -z "${invalidationId}" ]; then
    logError "No invalidation ID provided."
    return 1
  fi

  # Output looks like this:
  #   INVALIDATIONLIST        False           100     67
  #   ITEMS   2022-12-03T07:00:47.490000+00:00        I3UE1HOF68YV8W  InProgress
  #   ITEMS   2022-12-03T07:00:17.684000+00:00        I30WL0RTQ51PXW  Completed
  #   ITEMS   2022-12-03T00:46:38.567000+00:00        IFMPVDA8EX53R   Completed

  totalTime=0
  waitSeconds=5
  logInfo "Waiting on invalidation for distribution ${distributionId} invalidation ${invalidationId} to complete..."
  while true; do
    # The following should always return 0 or greater.
    #logInfo "Running: ${awsExe} cloudfront list-invalidations --distribution-id \"${cloudFrontDistributionId}\" --no-paginate --output text --profile \"${awsProfile}\""
    #${awsExe} cloudfront list-invalidations --distribution-id "${cloudFrontDistributionId}" --no-paginate --output text --profile "${awsProfile}"
    inProgressCount=$(${awsExe} cloudfront list-invalidations --distribution-id "${cloudFrontDistributionId}" --no-paginate --output text --profile "${awsProfile}" | grep "${invalidationId}" | grep InProgress | wc -l)
    #logInfo "inProgressCount=${inProgressCount}"

    if [ -z "${inProgressCount}" ]; then
      # This should not happen?
      logError "No output from listing invalidations for distribution ID:  ${cloudFrontDistributionId}"
      return 1
    fi

    if [ ${inProgressCount} -gt 0 ]; then
      logInfo "Invalidation status is InProgress.  Waiting ${waitSeconds} seconds (${totalTime} seconds total)..."
      sleep ${waitSeconds}
    else
      # Done with invalidation.
      break
    fi

    # Increment the total time.
    totalTime=$(( ${totalTime} + ${waitSeconds} ))
  done

  logInfo "Invalidation is complete (${totalTime} seconds total)."

  return 0
}

# Entry point into the script.

# Configure the echo command to output color.
configureEcho

# Check the operating system.
checkOperatingSystem

# Set the MkDocs executable:
# - will exit if MkDocs is not found
setMkDocsExe

# Set the AWS CLI executable.
setAwsExe

# Make sure the MkDocs version is OK.
checkMkdocsVersion

# Check the source files for issues.
checkSourceDocs

# Get the folder where this script is located since it may have been run from any folder.
scriptFolder=$(cd $(dirname "$0") && pwd)
echo "Script folder = ${scriptFolder}"
# Change to the folder where the script is since other actions below are relative to that.
cd ${scriptFolder} || exit

# Get the software version.
getVersion

# Set --dryrun to test before actually doing.
dryrun=""
#dryrun="--dryrun"
s3VersionFolder="s3://software.openwaterfoundation.org/geoprocessor/${version}/doc-user"
s3LatestFolder="s3://software.openwaterfoundation.org/geoprocessor/latest/doc-user"

if [ "$1" == "" ]; then
  echo ""
  echo "Usage:  $0 AmazonConfigProfile"
  echo ""
  echo "Copy the site files to the Amazon S3 static website folders:"
  echo "  ${s3VersionFolder}"
  echo "  ${s3LatestFolder}"
  echo ""
  exit 0
fi

awsProfile="$1"

# First build the site so that the "site" folder contains current content:
# - "mkdocs serve" does not do this

echo "Building mkdocs-project/site folder..."
cd ../mkdocs-project || exit
${mkdocsExe} build --clean
cd ${scriptFolder} || exit

# Now sync the local files up to Amazon S3.
if [ -n "${version}" ]; then
  # Upload documentation to the versioned folder.
  echo "Uploading documentation to:  ${s3VersionFolder}"
  read -p "Continue [Y/n/q]? " answer
  if [ -z "${answer}" -o "${answer}" = "y" -o "${answer}" = "Y" ]; then 
    echo aws s3 sync ../mkdocs-project/site ${s3VersionFolder} ${dryrun} --delete --profile "${awsProfile}"
    aws s3 sync ../mkdocs-project/site ${s3VersionFolder} ${dryrun} --delete --profile "${awsProfile}"
    exitStatusVersion=$?
    if [ ${exitStatusVersion} -eq 0 ]; then
      # Invalidate the CloudFront distribution.
      cloudFrontDistributionId=$(getCloudFrontDistribution)
      if [ -z "${cloudFrontDistributionId}" ]; then
        echo "Error getting the CloudFront distribution."
        exit 1
      fi
      # Use a wildcard to invalidate subfolders.
      cloudFrontFolder="/geoprocessor/${version}/doc-user/*"
      invalidateCloudFront ${cloudFrontDistributionId} ${cloudFrontFolder}
    fi
  elif [ "${answer}" = "q" ]; then 
    exit 0
  fi
fi

read -p "Also copy documentation to 'latest' [y/n/q]? " answer
exitStatusLatest=0
if [ "${answer}" = "y" ]; then 
  echo "Uploading documentation to:  ${s3LatestFolder}"
  read -p "Continue [Y/n/q]? " answer
  if [ -z "${answer}" -o "${answer}" = "y" -o "${answer}" = "Y" ]; then 
    aws s3 sync ../mkdocs-project/site ${s3LatestFolder} ${dryrun} --delete --profile "$awsProfile"
    exitStatusLatest=$?
    if [ ${exitStatusVersion} -eq 0 ]; then
      # Invalidate the CloudFront distribution.
      cloudFrontDistributionId=$(getCloudFrontDistribution)
      if [ -z "${cloudFrontDistributionId}" ]; then
        echo "Error getting the CloudFront distribution."
        exit 1
      fi
      # Use a wildcard to invalidate subfolders.
      cloudFrontFolder="/geoprocessor/latest/doc-user/*"
      invalidateCloudFront ${cloudFrontDistributionId} ${cloudFrontFolder}
    fi
  elif [ "${answer}" = "q" ]; then 
    exit 0
  fi
fi

exitStatus=$(expr ${exitStatusVersion} + ${exitStatusLatest})
