#!/usr/bin/env bash
#
# Copyright (C) 2018 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
PROJECTID="<projectid>"
DESCRIPTION="Sync from AWS to GCS"
AWSSOURCEBUCKET="<aws source bucket>"
AWSACCESSKEYID="<aws key id>"
AWSSECRETACCESSKEY="<aws secret access key>"
GCSSINKBUCKET="<gcs destination bucket without gs:// prefix>"
{ [ "$#" -eq 1 ] && INCLUDEPREFIX="$1"; } \
  || INCLUDEPREFIX="backup/year=<yyyy>/month=<mm>/day=<dd>/hour=<hh>"
KICKOFFDELAYMINS=5
TRANSFERSTOPMINS=60
ELAPSEDSECONDS=300
python transfer-aws-one-shot.py \
  --description="$DESCRIPTION" \
  --project-id="$PROJECTID" \
  --kickoff-delay-minutes="$KICKOFFDELAYMINS" \
  --aws-access-key-id="$AWSACCESSKEYID" \
  --aws-secret-access-key="$AWSSECRETACCESSKEY" \
  --source-bucket="$AWSSOURCEBUCKET" \
  --sink-bucket="$GCSSINKBUCKET" \
  --include-prefix="$INCLUDEPREFIX" \
  --transfer-stop-minutes="$TRANSFERSTOPMINS" \
  --elapsed-last-modification="$ELAPSEDSECONDS"
