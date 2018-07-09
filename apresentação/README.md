## Template de slide usado pela Coordenadoria de Segurança e Serviço e Internet - CTIC

###  Pré-Requisito 

Necessário instalar os pacotes latex-beamer e abntex2

#### Debian
```
# echo "deb http://downloads.sourceforge.net/project/abntex2-deb/debian testing main" > /etc/apt/sources.list.d/abntex2.list

@ sudo aptitude update

@ sudo aptitude install latex-beamer abntex2
```
### Compilando

Agora temos um _Makefile_ e para executar a compilação, só é preciso fazer:
```
make
```

e quando for necessário limpar o diretório:
```
make clean
```