#!/bin/bash
###
 # @Author: Vincent Young
 # @Date: 2023-05-27 03:25:35
 # @LastEditors: Vincent Young
 # @LastEditTime: 2023-05-27 03:49:35
 # @FilePath: /Inject-IPA/inject-theme.sh
 # @Telegram: https://t.me/missuo
 # 
 # Copyright © 2023 by Vincent, All Rights Reserved. 
### 

# Receive the path of the ipa file as input
IPA_PATH=$1

# Check if the path of the ipa file has been provided
if [ -z "$IPA_PATH" ]; then
	echo "Please provide a path to an ipa file. Usage: ./insert_theme.sh /path/to/your.ipa"
	exit 1
fi

# Extract the original filename (without extension)
FILE_NAME=$(basename "$IPA_PATH" .ipa)

# Unzip the ipa file
unzip -q $IPA_PATH -d wechat_unzipped

# Replace all files in the theme directory to Payload/*.app
cp -R xiamo/* wechat_unzipped/Payload/*.app/

# Delete .DS_Store files in Payload
find wechat_unzipped/Payload/ -name '.DS_Store' -type f -delete

# Repackage
cd wechat_unzipped
zip -qry ../"$FILE_NAME"-theme.ipa *

# Clean up temporary files
cd ..
rm -rf wechat_unzipped

echo "Task completed, the final file is $FILE_NAME-theme.ipa"