


$ docker history build
IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
78171a118279        12 hours ago        /bin/sh -c mkdir sgrep/bin && cd sgrep/src...   24.5kB              
2323bcb14b5f        12 hours ago        /bin/sh -c git clone https://github.com/co...   93.6kB              
8ec1470030af        12 hours ago        /bin/sh -c apk update && apk add git make ...   119MB               
7328f6f8b418        5 weeks ago         /bin/sh -c #(nop)  CMD ["/bin/sh"]              0B                  
<missing>           5 weeks ago         /bin/sh -c #(nop) ADD file:4583e12bf5caec4...   3.97MB              



$ docker history pwned-passwords
IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
e63a6121fe33        3 minutes ago       /bin/sh -c #(nop)  ENTRYPOINT ["/usr/local...   0B                  
9a7db1341995        3 minutes ago       /bin/sh -c #(nop) COPY file:b098e8cba82eef...   1.08kB              
a1f4a26a50a4        About an hour ago   /bin/sh -c #(nop) COPY file:bf96562251dbd1...   15.7kB              
f99b3a9601ea        About an hour ago   /bin/sh -c apk update && apk add openssl p...   10.7MB              
7328f6f8b418        5 weeks ago         /bin/sh -c #(nop)  CMD ["/bin/sh"]              0B                  
<missing>           5 weeks ago         /bin/sh -c #(nop) ADD file:4583e12bf5caec4...   3.97MB              
