# **Les bases du language Java** <a href="https://www.java.com" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/java/java-original.svg" alt="java" align="right" width="64" height="auto" /></a>


## Organisation

* avoir un répertoire dévolu à développement en Java ;
* avoir un sous-répertoire par projet ;
* veiller à la présence des fichiers `.java`et `.class` à la base du projet, le cas échéan les copier d'un autre.  

## Syntaxe

* une instruction :  
    * se termine par un `;` ;  
    * peut s'écrire sur plusieurs lignes ;  
* commentaire :  
    * sur un ligne est symbolisé par `//` ;  
    * sur plusieures lignes débute par `/` et termine par `/`.  

## Autres règles  

* tout programme Java comporte au moins une classe "ex :`public class Hello`" ;  
* toute application doit posséder au moins un point d'entrée, ex : `main`qu'on peut appeler de l'extérieiur, d'où le mot public :
    * le mot `static` est obligatoire ;
* les instructions apparaissent au sein du bloc délimité par `{` et `}` ;
* `System.out.println("Bonjour!");` pour afficher proprement.  
    _Cette instruction consiste à appeler une fonction prédéfinie - c'est-à-dire un ensemble d’instructions -, affichant des informations à l'écran, et à lui précisant ce qu'elle doit afficher._
* la syntaxe est importante, sinon le compilateur génère une erreur, donc :
    * attention aux `{ } ;`, les mots clés.  
    _il est indispensable de comprendre la syntaxe de Java pour qu le code soit valide est fonctionnel._  
* les conventions de codages _sont aussi imoortantes **pour assuré une bonne lisiblité et facilité la maintenance**_ :
    * les noms des classes s'écrivent en 'upper camel case' ("MyClass") ;  
    * les noms des variables et méthodes s'écrivent en 'lower camel case ("myViable" ou "myMethod") ;  
    * les constantes s'écrivent en majuscules et séparées par des undersocdes ("MY_CONSTANT") ;  
    * les accolades doivent êtres utilisés pour délimiter les blocs de code et correctement alignées `{if` ou `{for` impérativement sur la même ligne ;  
    * pour facilité la compréhension, il est recommandé d'utiliser des noms de variables et méthodes significatifs.