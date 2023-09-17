#!/bin/sh

cat >config.lua <<'EOF'
BOTNAME = os.getenv("BOTNAME") or "funkybot"
PASSWORD = os.getenv("BOTPASS")
CHANNELS = {os.getenv("CHANNEL") or "#esolangs"}
EOF

cat >mzstorkipiwanbotbotbot <<'EOF'
#!/bin/sh -ex
ROOT=/usr/src/app/script
export SERVER=$1
export PORT=$2
export LUA_PATH='?.lua'
(cd $ROOT && socat "EXEC:gnutls-cli $SERVER -p $PORT" "EXEC:lua mzstorkipiwanbotbotbot.lua")
EOF

chmod 755 mzstorkipiwanbotbotbot
