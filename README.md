# Wrapper ANYMARKET em Object Pascal (Delphi)

O projeto está otimizado para [Delphi 12](https://www.embarcadero.com/br/products/rad-studio/whats-new-in-12-athens). Conta com formulários Master Detail para edição e inserção de elementos.


## Avisos

> [!CAUTION]
> As units Core.UI e Core.Utils não são documentadas e estão diretamente relacionadas com o bom funcionamento do restante do ambiente. É **desaconselhável** a edição em qualquer um desses arquivos.

## Descrição

### _delphi

Endereço que abriga os arquivos relativos a aplicação propriamente dita.

Este projeto contem *units* interligadas que podem ser extraidas para aplicação em outros projetos mais extensos onde haja a necessidade de integrar [Anymarket](https://anymarket.com.br/) e uma aplicação em Delphi.

Há a possibilidade de fazer solicitações diretas (via `MakePOST`, `MakeGET`, `MakeDELETE`, `MakePUT`), ou de utilizar métodos especializados documentados na Unit.

As *units* do núcleo do projeto são essenciais para o funcionamento e sua modificação é desaconselhada. 

### _api

Endereço que abriga o arquivo `.YAML` e seu correspondente convertido para `.JSON` para utilização em `REST Clients` para suporte aos testes. Durante os trabalhos de integração foram utilizados [Hoppscotch](https://hoppscotch.io/) e [Bruno](https://www.usebruno.com/).

### _uml

Contém a representação dos fluxos elaborados pela fornecedora da API e adaptados ao processo realizado pelo wrapper.

---

## Estrutura Padrão de Resposta Processada

```json
{
	"data": Object || Array of Object, /**/
	"response_code": Integer,
  	"status": string; /*success, success - no content, failed*/
}
```