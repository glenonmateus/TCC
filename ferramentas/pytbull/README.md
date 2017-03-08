# O que é '''Pytbull'''? #

Você está configurando seu Sistema de Detecção/Prevenção de Intrusão (IDS/IPS) e sente, "Agora estou seguro". Mas como posso ter certeza disso? E quanto você confia no seu IDS/IPS

A única maneira de garantir que seu IDS/IPS detectar e bloquear tráfego indesejado é testando com uma cargas e ferramentas especificas, mas esse trabalho pode levar horas ou dias.

Por que todo esse trabalho? Aqui é onde entra o Pytbull!

Pytbull é um ''framework'' de teste de IDS/IPS flexível baseado em python com mais de 300 testes, agrupados em 11 módulos, cobrindo um grande escopo de ataques: 

1. ''badTraffic'': Pacotes não compatíveis com RFC são enviados ao servidor para testar como os pacotes são processados;
2. ''bruteForce'': Testa a capacidade do servidor de rastrear ataques de força bruta (por exemplo, FTP). Faz uso de regras personalizadas no Snort e Suricata;
3. ''clientSideAttacks'': Este módulo usa um shell reverso para fornecer ao servidor instruções para baixar arquivos maliciosos remotos. Este módulo testa a capacidade do IDS / IPS para proteger contra ataques do lado do cliente;
4. ''denialOfService'': Testa a capacidade do IDS / IPS para proteger contra tentativas de DoS;
5. ''evasionTechniques'': Várias técnicas de evasão são usadas para verificar se o IDS / IPS pode detectá-los;
6. ''fragmentedPackets'': Vários '''payloads''' fragmentados são enviados ao servidor para testar sua capacidade de recompô-las e detectar os ataques;
7. ''ipReputation'': Testa a capacidade do servidor para detectar tráfego de / para servidores de baixa reputação;
8. ''normalUsage'': Cargas úteis que correspondem a um uso normal;
9. ''pcapReplay'': Permite reproduzir arquivos pcap;
10. ''shellCodes'': Enviar vários shellcodes para o servidor na porta 21 / tcp para testar a capacidade do servidor para detectar / rejeitar shellcodes;
11. ''testRules'': Teste de regras básicas. Esses ataques devem ser detectados pelos conjuntos de regras enviados com o IDS / IPS.

Há basicamente 5 tipos de testes:
 
1. ''socket'': abra um socket em uma determinada porta e envie as cargas para o destino remoto nessa porta;
2. ''command'': Enviar comando para o destino remoto com o subprocess.call () função python;
3. ''scapy'': Enviar cargas especiais crafted baseado na sintaxe Scapy;
4. ''client side attacks'': Use um shell reverso no destino remoto e envie comandos para ele para processá-los pelo servidor (geralmente comandos wget);
5. ''pcap replay'': Permite reproduzir o tráfego baseado em arquivos pcap. 

[Pytbull](http://pytbull.sourceforge.net/)

## Instalação ##

### Cliente ###

Necessário instalar o Python (2.6.5) e dependências

> $ sudo aptitude install python python-scapy python-feedparser python-cherrypy3

Instale também as ferramentas necessárias

> $ sudo aptitude install nmap hping3 nikto tcpreplay apache2-utils

Por fim, você precisará do '''ncrack''' para testar o módulo bruteForce:

> $ sudo aptitude install build-essential checkinstall libssl-dev libssh-dev

### '''Pytbull''' ###
