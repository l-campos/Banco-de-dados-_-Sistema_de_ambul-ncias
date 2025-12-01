# 🚑 Sistema de Gestão de Ambulâncias

Projeto final da disciplina de Banco de Dados (UnB). O sistema gerencia o despacho de ambulâncias, histórico de pacientes e controle de frota utilizando Python (Streamlit) e MySQL.

## 🚀 Como Rodar a Aplicação

### 1. Instalação das Dependências

Certifique-se de ter o Python instalado. Rode o seguinte comando para instalar o streamlit:

```
pip install streamlit
```


Em seguida, instale as bibliotecas específicas do projeto

```
pip install mysql-connector-python pandas
```


### 2. Configuração do Banco de Dados

Abra seu cliente MySQL, e execute todo o script SQL do repositório.

Certifique-se de que o banco GestaoAmbulancias foi criado corretamente, caso não, descomente a primeira linha do código.

### 3. Executando o Sistema

Salve o arquivo principal da aplicação (ex: app.py) em algum diretório.

No terminal, navegue até esse diretório:

cd caminho/para/sua/pasta


Execute o comando abaixo para iniciar o servidor do Streamlit:

```
python -m streamlit run app.py
```

O streamlit vai iniciar e abrir no navegador (geralmente em http://localhost:8501).
