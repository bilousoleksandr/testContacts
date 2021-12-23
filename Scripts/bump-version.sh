NEW_VERSION="$1"
 SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
 PROJ_DIR="$SCRIPT_DIR/.."
 DATE=$(date +'(%d,%b %Y)')

 echo $NEW_VERSION

 CHANGELOG_PATH="$PROJ_DIR/CHANGELOG.md"
 TMP_CHANGELOG_PATH="$PROJ_DIR/CHANGELOG_1.md"

 sed 's/'"## Develop"'/'"## $NEW_VERSION $DATE"'/g' $CHANGELOG_PATH > $TMP_CHANGELOG_PATH; mv $TMP_CHANGELOG_PATH $CHANGELOG_PATH
 sed '1s/^/## Develop\n\n#### New\n\n#### Updated\n\n#### Fixed\n\n#### Boring stuff\n\n/' $CHANGELOG_PATH > $TMP_CHANGELOG_PATH; mv $TMP_CHANGELOG_PATH $CHANGELOG_PATH

 CONFIG_PATH="$PROJ_DIR/Configs/Common.xcconfig"
 TMP_CONFIG_PATH="$PROJ_DIR/Configs/Common1.xcconfig"


 CURRENT_VERSION=$(cat $CONFIG_PATH | grep "CURRENT_PROJECT_VERSION " | awk -F " " '{ print $3 }')
 echo $CURRENT_VERSION

 sed 's/'"$CURRENT_VERSION"'/'"$NEW_VERSION"'/g' $CONFIG_PATH > $TMP_CONFIG_PATH; mv $TMP_CONFIG_PATH $CONFIG_PATH
