lazy_calculator
===============

_In computer programming, lazy initialization is the tactic of delaying the creation of an object, the calculation of a value, or some other expensive process until the first time it is needed._ [Wikipédia](http://en.wikipedia.org/wiki/Lazy_initialization).

Inspirado pelo ótimo [20,000 Leagues Under ActiveRecord](http://patshaughnessy.net/2014/9/17/20000-leagues-under-activerecord), decidi tentar implementar uma classe que utiliza a tática de _lazy initialization_ para postergar um processamento, teoricamente, custoso. A idéia, tal qual acontece com o ActiveRecord (explicado no post linkado) é ir adicionando condições à um objeto para, posteriormente, executar uma tarefa.

Para exemplificar, criei a [LazyCalculator](https://github.com/matiasleidemer/lazy_calculator). Uma calculatora que armazena as condições (por hora, apenas adição e subtração) e, quando solicitada, calcula o resultado.


```ruby
require_relative "lazy_calculator"

calculator = LazyCalculator.new
=> #<LazyCalculator:0x007fbbe31a7ee8 @numbers=[], @operations=[]>

calculator.plus(5)
=> #<LazyCalculator:0x007fcc24885098 @numbers=[5], @operations=[:+]>

calculator.minus(2)
=> #<LazyCalculator:0x007fcc2488df18 @numbers=[5, 2], @operations=[:+, :-]>

irb(main):006:0> calculator.calc
=> 3
```

Obviamente a complexidade da LazyCalculator nem se compara com a do ActiveRecord. Mas acho que a idéia fica bem clara nos exemplos acima. Observe que os métodos `plus` e `minus` retornam novas instâncias da própria LazyCalculator. Isso possibilita o encadeamento (method chaining) de vários métodos:

```ruby
calculator = LazyCalculator.new

calculator.plus(5).minus(1).minus(9).plus(1).calc 
=> -3
```

Também fica bem claro como o método `calc` é postergado até o momento em que é realmente necessário. Quando executado, ele verifica os valores e operações que já existem no objeto atual e realiza o cálculo. 

Eu já havia observado esse comportamento no ActiveRecord, mas ainda não havia tirado um tempo para dar uma olhada com mais calma. Esse tipo de solução me agrada, simples e efetiva, utilize em seu código sempre que parecer conveniente.

