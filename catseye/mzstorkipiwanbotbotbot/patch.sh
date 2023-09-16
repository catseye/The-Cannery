#!/bin/sh

cat >config.lua <<'EOF'
BOTNAME = os.getenv("BOTNAME") or "funkybot"
print(BOTNAME)
PASSWORD = os.getenv("BOTPASS")
print(PASSWORD)
CHANNELS = {os.getenv("CHANNEL") or "#esolangs"}
print(CHANNELS)
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
