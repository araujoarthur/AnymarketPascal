# Anymarket<>Pascal

## Descrição
O projeto Anymarket Pascal tem por finalidade criar, de forma simples, a interface de integração entre sistemas ERP escritos **em Delphi** e a plataforma [Anymarket](https://anymarket.com.br/). 

O projeto é composto por uma **biblioteca principal** que contém as funcionalidades relacionadas as requisições realizadas à plataforma, uma **biblioteca essencial**, que armazena funções e tipos utilizados para implementação da interface de usuário e uma **biblioteca visual** com formulários **MasterDetail** para o CRUD dos módulos da plataforma.

!!! warning  "Atenção"
    A funcionalidade da biblioteca visual é fortemente acoplada com a biblioteca essencial. **O funcionamento interno de ambas as bibliotecas não é documentado e é contra-indicado realizar alterações no código de ambas.**

## Project layout

    mkdocs.yml    # The configuration file.
    docs/
        index.md  # The documentation homepage.
        ...       # Other markdown pages, images and other files.
