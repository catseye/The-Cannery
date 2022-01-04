FROM rwstauner/haste-compiler
RUN haste-cabal update && \
    haste-cabal install parsec-3.1.1 && \
    rm -rf /root/.cabal && \
    chmod -R +x /root && \
    chmod +r /root
