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
SOURCEBUCKET="<source GCS bucket without gs:// prefix>"
SINKBUCKET="<sink GCS bucket without gs://prefix>"
DESCRIPTION="Sync from gs://${SOURCEBUCKET} to gs://${SINKBUCKET}"
{ [ "$#" -eq 1 ] && INCLUDEPREFIX="$1"; } \
  || INCLUDEPREFIX="backup/year=<yyyy>/month=<mm>/day=<dd>/hour=<hh>"
KICKOFFDELAYMINS=5
TRANSFERSTOPMINS=60
ELAPSEDSECONDS=300
python transfer-gcs-one-shot.py \
  --description="$DESCRIPTION" \
  --project-id="$PROJECTID" \
  --kickoff-delay-minutes="$KICKOFFDELAYMINS" \
  --source-bucket="$SOURCEBUCKET" \
  --sink-bucket="$SINKBUCKET" \
  --include-prefix="$INCLUDEPREFIX" \
  --transfer-stop-minutes="$TRANSFERSTOPMINS" \
  --elapsed-last-modification="$ELAPSEDSECONDS"
