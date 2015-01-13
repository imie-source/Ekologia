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
    * Etendre la classe `coop.ekologia.service.mapper.Mapper`
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
    * L'appel aux jsp doit se faire gr�ce � la fonction `EkologiaServlet.forwardToJsp(String, HttpServletRequest, HttpServletResponse)` (cf. javadoc pour plus d'explication)
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


Script SQL
----------

Afin de faciliter la mise � jour des bases de donn�es des diff�rents membres de l'�quipe, nous allons utiliser les conventions suivantes :
* Chaque modification de la base de donn�es doit se trouver dans le dossier `script\evolutions`
* Le nom de ces fichiers est `<numero>.sql` o� `<numero>` permet de conna�tre l'ordre d'ex�cution des scripts
* Lors d'une mise � jour du code et donc de la base de donn�es, seules les nouveaux fichiers SQL seront � ex�cuter
* Si une erreur est remarqu�e dans un fichier SQL d�j� commit�, cr�er un nouveau fichier SQL corrigeant le probl�me, ne jamais modifier un fichier d�j� commit�
* Lors du `merge` avant un `commit` et un `push`, des conflits peuvent exister. Le renommage du fichier sql vers le num�ro suivant du dernier existant corrige le probl�me
* Ne jamais r�cup�rer un dump de la base de donn�es, qui recr�era l'ensemble des scripts de cr�ation de la base, sans pour autant corriger des erreurs existantes et pouvant amener � des conflits

Internationalisation
--------------------

Aussi appel� `i18n` car 18 lettres entre `i` et `n` (terme utilis� dans le code sur internet).

* Pr�paration:
    * Cr�er un fichier dans `EkologiaGUI/src/i18n` un fichier nomm� `<module>.properties` o� `<module>` est votre module. si ce sont des sous-modules, collez les noms (ex: `groupwiki` pour `group/wiki`). Ce fichier contient les traduction par d�faut, en anglais.
    * Cr�er autant de propri�t�s de d'�l�ments � traduire.
    * Convention de nommage: `aaa.bbb.ccc` sans accent, en essayant de regrouper les noms comme des packages (ex: `registration.usertype.label`, cf. `jsp/user/registration.jsp` pour exemples).
    * Les traductions par langue sont dans les fichiers `<module>_<lang>.properties` (ex: `groupwiki_fr.properties`, `groupwiki_en.properties`).
* Utilisation:
    * Depuis une JSP:
        * Ajouter `<fmt:setLocale value="${ currentLanguage }" />` au d�but du fichier. `currentLanguage` est une variable fournie par la m�thode `EkologiaServlet.forwardToJsp(String, HttpServletRequest, HttpServletResponse)`
        * Ajouter en dessous `<fmt:setBundle basename="i18n.<module>"/>` en rempla�ant `<module>` par votre nom de module (cf. partie `Pr�paration`)
        * Utiliser `<fmt:message key="your.key" />` pour un affichage direct (en dehors de tout balise)
        * Utiliser `<fmt:message key="your.key" var="message" />`, puis `${ message }` pour des textes dans les balises (cf. `jsp/user/registration.jsp` pour exemples)
    * Depuis java:
        * Injecter le service `I18nService` (`EkologiaGUI` seulement)
        * Appeler la m�thode `translate(String, String)`.
            * Le premier param�tre est la langue (obtenue via `EkologiaServlet.getCurrentLanguage(HttpServletRequest)`).
            * Le second est la clef, pr�fix�e par votere module (ex: `user.registration.email.empty` pour la clef `registration.email.empty` du module `user`). Cette convention est obligatoire pour que �a marche.

Gestion des erreurs dans les formulaires
----------------------------------------

Vous trouverez la classe `FormErrors` qui permettra de g�rer les erreurs et les traductions associ�es. Voici comment l'utiliser :
* Dans java:
    * Injecter le service `FormErrors`
    * Avant de l'utiliser, effectuer un `FormErrors.setLanguage(getCurrentLanguage(request))`. Lorsque nous aurons trouver un moyen de r�cup�rer directement depuis la requ�te, cette op�ration ne sera plus n�cessaire.
    * Pour chaque erreur, ajouter une erreur via `FormErrors.addError(String, String)`
        * Le premier param�tre est le nom de votre champ
        * Le second, la clef qui sera utilis�e par le service `I18nService` (cf. partie `Internationalisation`)
    * Chaque clef peut avoir plusieurs erreurs
    * Pour savoir s'il existe des erreurs, utiliser `FormErrors.isEmpty()`
* Dans JSP (on suppose que la liste de erreurs se nomme `errors`):
    * ```
        <c:if test="${ errors != null && errors.get('myfield') != null }">
            <c:forEach var="error" items="${ errors.get('myfield') }">
                <c:out value="${ error }" />
            </c:forEach>
        </c:if>
      ```
* Cf. `registration.jsp` et `RegistrationServlet`

Utilisation de constantes
-------------------------

Afin d'�viter les erreurs de copies, ainsi que de ne pas casser un existant, il est conseill� d'exporter l'ensemble des constantes dans une classe externe.
Ces cosntants seront dans le packages `coop.ekologia.presentation.constants`.
Nous utiliserons une interface par module (et sous module) dont le nom est `ModuleConstants` ou `SousModuleConstants`.
Toutes les constantes sont des objets ou primitifs (`int`, `long`, etc.), d�clar�es sans modificateur de visibilit� (`String AAA = "aaa"`et non `public static final String AAA = "aaa"`).
Le nom des constantes sont en majuscules, s�par�es par des underscores (ex: `AAA_BBB_CCC`).
Pr�fixer les constantes par leur type (ex: `PARAMETER_*` ou `ATTRIBUTE_*`).

Divers
------

Eviter d'avoir des warning (ex: variable inutilis�e)