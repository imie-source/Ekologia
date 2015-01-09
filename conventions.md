Conventions pour le projet Ekologia
===================================

Les conventions pr�sent�es ci-dessous permettent d'organiser le projet, ainsi que de pouvoir facilement retrouver et diff�rencier les composants du projet.

Nommage, packages et h�ritages/impl�mentations
----------------------------------------------

* Les noms des classes et variables respectent la convention oracle
* Les noms des classes et variables doivent �tre en anglais
* Tous les DTO doivent avoir le suffixe `DTO` (ex: `UserDTO`, `pageDTO`)
* Tous les mapper, permettant un mapping entit�/DTO devront :
    * Etre dans le package `coop.ekologia.service.mapper`
    * Etendre l'interface `coop.ekologia.service.mapper.Mapper`
    * Poss�der le suffixe `Mapper` (ex: `UserMapper`, `PageMapper`)
* Tous les services doivent :
    * Avoir le suffixe `Service`
    * Ne doit pas renvoyer d'entit�, toujours des DTO
    * Etre dans un sous-package de `coop.ekologia.service`
    * H�riter d'une interface dont le nom est le nom du service, suffix� de `Interface` (ex: `UserServiceInterface` pour le service `UserService`)
    * Eviter d'avoir un nom
* Toutes les servlets doivent :
    * Etendre la classe `coop.ekologia.presentation.controller.EkologiaServlet`
    * Avoir le suffixe `Servlet` (ex: `LoginServlet`, `PageServlet`)
    * Poss�der une m�thode `public static final String routing(HttpServletRequest, <params>)` permettant de g�n�rer une url vers cette servlet selon les arguments pass�s en param�tre (comme les param�tres sont variables, nous n'utilisons pas d'interface)
    * Etre dans un sous-package de `coop.ekologia.presentation.controller`
* Tous les filtres d'acc�s aux servlet doivent :
    * Avoir le suffixe `Filter`
    * Etre dans le package ou un sous-package de `coop.ekologia.presentation.security`
* Les sessions seront g�r�es gr�ce � des classes (permet un typage fort et une maintenance plus facile), ces classes doivent :
    * Avoir le suffixe `Session` (ex: `LoginSession`)
    * Impl�menter `Serializable` (sinon, cela provoque une erreur lors du d�ploiement)
    * Etre dans le package `coop.ekologia.presentation.session`
* Diviser les classes dans diff�rents packages et sous-packages selon les modules et sous-modules (ex: `user`, `group`, `group.wiki`) et ce, pour chaque projet


Documentation et commentaires
-----------------------------

* Utiliser les conventions de la javadoc (`/** doc */`)
* Ne pas mettre de documentation, ni de commentaire vide ou inutile
* Mettre la documentation en priorit� dans les interface et non dans les classes concr�tes
* Pour des exemple, utiliser la syntaxe `{@code mon code}`
* Pour des liens entre classes, m�thodes et champs, utiliser la syntaxe `{@link MaClasse#maMethodOuMonChamp}`


Divers
------

Eviter d'avoir des warning (ex: variable inutilis�e)