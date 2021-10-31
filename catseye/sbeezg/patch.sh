#!/bin/sh

mkdir bin
cat >bin/sbeezg <<'EOF'
#!/bin/sh
echo 'To execute a Sbeezg program, run:'
echo ''
echo '  sbeezg:run("your-sbeezg-program").'
echo ''
echo 'Also, sbeezg:test(N) where N is a small'
echo 'integer will run one of the test cases.'
echo ''
erl -pa /usr/src/app/ebin
EOF
chmod 755 bin/sbeezg
