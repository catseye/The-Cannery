#!/bin/sh

cat >defeat/defeat <<'EOF'
#!/bin/sh
(cd /usr/src/app/script && julia defeat.jl)
EOF
chmod 755 defeat/defeat
