#!/bin/sh

cat >bin/granolam <<'EOF'
#!/bin/sh
escript `dirname $0`/../src/granolam.erl $*
EOF
chmod 755 bin/granolam
