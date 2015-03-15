#!/bin/bash
# -*- coding: utf-8 -*-

cd `dirname $0`
source ../slack-config.sh

CHANNEL=active
declare -a GARBAGES=('' ':fire:一般ごみ' ':recycle:缶・ビン・ペットボトル' '' ':fire:一般ごみ' '' '');

garbage=${GARBAGES[$(date +%w)]}
uri="https://$SLACK_TEAM.slack.com/services/hooks/slackbot?token=$SLACK_TOKEN&channel=%23$CHANNEL"
if [ -n "$garbage" ]; then
    curl --data "明日は$garbage回収の日です。忘れずに出しておきましょう。" $uri
fi
