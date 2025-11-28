({
    doInit_Helper: function(c, e, h, objectName) {
        try {
            h.showSpinner_Helper(c, e);
            let showHideSections = {};
            showHideSections.showHasChildren = false;
            showHideSections.showTypeOfChildren = false;
            showHideSections.showAllChirenAreAbove18 = false;
            showHideSections.showMarriageSection = false;
            showHideSections.showSpouse2Section = false;
            showHideSections.showGuradianSection = false;
            showHideSections.showChildrenSection = false;
            showHideSections.showEscrowConditionSection = false;
            showHideSections.showAllChildrenSection = false;
            showHideSections.showAllowEditOrRecallSection = true;
            showHideSections.showLastSurvivingSection = true;
            showHideSections.showCohabitingSection = false;
            showHideSections.showSpouse1AndSouse2Table = false;
            showHideSections.showMarriageDatePicklist = true;
            showHideSections.showYearOfMarriage = false;
            showHideSections.showCohabitingYear = true;
            showHideSections.showYearOfCohabiting = false;
            showHideSections.showInheritanceFromFirstDeceased = true;
            showHideSections.showInheritanceAsSingle = true;

            c.set("v.showHideSections", showHideSections);

            let showHideFieldsUsingUniqueName = {};
            showHideFieldsUsingUniqueName.IndledendeSprgsml_Hvadervigtigtforkunden = {};
            showHideFieldsUsingUniqueName.IndledendeSprgsml_Hvadervigtigtforkunden.isVisible = false;
            showHideFieldsUsingUniqueName.IndledendeSprgsml_Hvadervigtigtforkunden.isMandatory = false;
            showHideFieldsUsingUniqueName.IndledendeSprgsml_Hvadervigtigtforkunden.hasError = false;

            showHideFieldsUsingUniqueName.IndledendeSprgsml_TestamenteType = {};
            showHideFieldsUsingUniqueName.IndledendeSprgsml_TestamenteType.isVisible = false;
            showHideFieldsUsingUniqueName.IndledendeSprgsml_TestamenteType.isMandatory = false;
            showHideFieldsUsingUniqueName.IndledendeSprgsml_TestamenteType.hasError = false;

            showHideFieldsUsingUniqueName.IndledendeSprgsml_TypeBrn = {};
            showHideFieldsUsingUniqueName.IndledendeSprgsml_TypeBrn.isVisible = false;
            showHideFieldsUsingUniqueName.IndledendeSprgsml_TypeBrn.isMandatory = false;
            showHideFieldsUsingUniqueName.IndledendeSprgsml_TypeBrn.hasError = false;

            showHideFieldsUsingUniqueName.IndledendeSprgsml_Skalarvengivesvideresomsreje = {};
            showHideFieldsUsingUniqueName.IndledendeSprgsml_Skalarvengivesvideresomsreje.isVisible = false;
            showHideFieldsUsingUniqueName.IndledendeSprgsml_Skalarvengivesvideresomsreje.isMandatory = false;
            showHideFieldsUsingUniqueName.IndledendeSprgsml_Skalarvengivesvideresomsreje.hasError = false;

            showHideFieldsUsingUniqueName.IndledendeSprgsml_Skalarvenbndlgges = {};
            showHideFieldsUsingUniqueName.IndledendeSprgsml_Skalarvenbndlgges.isVisible = false;
            showHideFieldsUsingUniqueName.IndledendeSprgsml_Skalarvenbndlgges.isMandatory = false;
            showHideFieldsUsingUniqueName.IndledendeSprgsml_Skalarvenbndlgges.hasError = false;

            showHideFieldsUsingUniqueName.IndledendeSpørgsmål_Ønskesgravstedsvedligeholdelse = {};
            showHideFieldsUsingUniqueName.IndledendeSpørgsmål_Ønskesgravstedsvedligeholdelse.isVisible = false;
            showHideFieldsUsingUniqueName.IndledendeSpørgsmål_Ønskesgravstedsvedligeholdelse.isMandatory = false;
            showHideFieldsUsingUniqueName.IndledendeSpørgsmål_Ønskesgravstedsvedligeholdelse.hasError = false;

            showHideFieldsUsingUniqueName.IndledendeSprgsml_HarDuItidligereoprettettestamente = {};
            showHideFieldsUsingUniqueName.IndledendeSprgsml_HarDuItidligereoprettettestamente.isVisible = false;
            showHideFieldsUsingUniqueName.IndledendeSprgsml_HarDuItidligereoprettettestamente.isMandatory = false;
            showHideFieldsUsingUniqueName.IndledendeSprgsml_HarDuItidligereoprettettestamente.hasError = false;

            showHideFieldsUsingUniqueName.IndledendeSprgsml_Sidderduellerdinpartneriuskiftetboi = {};
            showHideFieldsUsingUniqueName.IndledendeSprgsml_Sidderduellerdinpartneriuskiftetboi.isVisible = false;
            showHideFieldsUsingUniqueName.IndledendeSprgsml_Sidderduellerdinpartneriuskiftetboi.isMandatory = false;
            showHideFieldsUsingUniqueName.IndledendeSprgsml_Sidderduellerdinpartneriuskiftetboi.hasError = false;

            showHideFieldsUsingUniqueName.IndledendeSprgsml_Erallebrnmyndige = {};
            showHideFieldsUsingUniqueName.IndledendeSprgsml_Erallebrnmyndige.isVisible = false;
            showHideFieldsUsingUniqueName.IndledendeSprgsml_Erallebrnmyndige.isMandatory = false;
            showHideFieldsUsingUniqueName.IndledendeSprgsml_Erallebrnmyndige.hasError = false;


            showHideFieldsUsingUniqueName.IndledendeSprgsml_Harbrn = {};
            showHideFieldsUsingUniqueName.IndledendeSprgsml_Harbrn.isVisible = false;
            showHideFieldsUsingUniqueName.IndledendeSprgsml_Harbrn.isMandatory = false;
            showHideFieldsUsingUniqueName.IndledendeSprgsml_Harbrn.hasError = false;

            showHideFieldsUsingUniqueName.IndledendeSprgsml_Skaldertageshjeforfremtidigebrn = {};
            showHideFieldsUsingUniqueName.IndledendeSprgsml_Skaldertageshjeforfremtidigebrn.isVisible = false;
            showHideFieldsUsingUniqueName.IndledendeSprgsml_Skaldertageshjeforfremtidigebrn.isMandatory = false;
            showHideFieldsUsingUniqueName.IndledendeSprgsml_Skaldertageshjeforfremtidigebrn.hasError = false;

            showHideFieldsUsingUniqueName.IndledendeSprgsml_Skalderindsttesbrnetestamente = {};
            showHideFieldsUsingUniqueName.IndledendeSprgsml_Skalderindsttesbrnetestamente.isVisible = false;
            showHideFieldsUsingUniqueName.IndledendeSprgsml_Skalderindsttesbrnetestamente.isMandatory = false;
            showHideFieldsUsingUniqueName.IndledendeSprgsml_Skalderindsttesbrnetestamente.hasError = false;


            showHideFieldsUsingUniqueName.IndledendeSpørgsmål_Civilstatus = {};
            showHideFieldsUsingUniqueName.IndledendeSpørgsmål_Civilstatus.isVisible = false;
            showHideFieldsUsingUniqueName.IndledendeSpørgsmål_Civilstatus.isMandatory = false;
            showHideFieldsUsingUniqueName.IndledendeSpørgsmål_Civilstatus.hasError = false;


            showHideFieldsUsingUniqueName.Samlevende_Lngstlevendestestationsret = {};
            showHideFieldsUsingUniqueName.Samlevende_Lngstlevendestestationsret.isVisible = false;
            showHideFieldsUsingUniqueName.Samlevende_Lngstlevendestestationsret.isMandatory = false;
            showHideFieldsUsingUniqueName.Samlevende_Lngstlevendestestationsret.hasError = false;


            showHideFieldsUsingUniqueName.Samlevende_Skaltilbagekaldelseellerndringkrvesamtykkefrabeggeparter = {};
            showHideFieldsUsingUniqueName.Samlevende_Skaltilbagekaldelseellerndringkrvesamtykkefrabeggeparter.isVisible = false;
            showHideFieldsUsingUniqueName.Samlevende_Skaltilbagekaldelseellerndringkrvesamtykkefrabeggeparter.isMandatory = false;
            showHideFieldsUsingUniqueName.Samlevende_Skaltilbagekaldelseellerndringkrvesamtykkefrabeggeparter.hasError = false;


            showHideFieldsUsingUniqueName.Samlevende_Ejerifastejendomellerandetsammen = {};
            showHideFieldsUsingUniqueName.Samlevende_Ejerifastejendomellerandetsammen.isVisible = false;
            showHideFieldsUsingUniqueName.Samlevende_Ejerifastejendomellerandetsammen.isMandatory = false;
            showHideFieldsUsingUniqueName.Samlevende_Ejerifastejendomellerandetsammen.hasError = false;

            showHideFieldsUsingUniqueName.Samlevende_Skaltestamentetfortsatgldehvislngstlevendeblivetgift = {};
            showHideFieldsUsingUniqueName.Samlevende_Skaltestamentetfortsatgldehvislngstlevendeblivetgift.isVisible = false;
            showHideFieldsUsingUniqueName.Samlevende_Skaltestamentetfortsatgldehvislngstlevendeblivetgift.isMandatory = false;
            showHideFieldsUsingUniqueName.Samlevende_Skaltestamentetfortsatgldehvislngstlevendeblivetgift.hasError = false;

            showHideFieldsUsingUniqueName.Samlevende_Skallngstlevendemodtagearvensomsreje = {};
            showHideFieldsUsingUniqueName.Samlevende_Skallngstlevendemodtagearvensomsreje.isVisible = false;
            showHideFieldsUsingUniqueName.Samlevende_Skallngstlevendemodtagearvensomsreje.isMandatory = false;
            showHideFieldsUsingUniqueName.Samlevende_Skallngstlevendemodtagearvensomsreje.hasError = false;


            showHideFieldsUsingUniqueName.Samlevende_Skalbestemmelserderomhandlerbrneneandrearvingevedvare = {};
            showHideFieldsUsingUniqueName.Samlevende_Skalbestemmelserderomhandlerbrneneandrearvingevedvare.isVisible = false;
            showHideFieldsUsingUniqueName.Samlevende_Skalbestemmelserderomhandlerbrneneandrearvingevedvare.isMandatory = false;
            showHideFieldsUsingUniqueName.Samlevende_Skalbestemmelserderomhandlerbrneneandrearvingevedvare.hasError = false;

            showHideFieldsUsingUniqueName.Samlevende_Skaltestamentetbortfaldevedsamlivetsophr = {};
            showHideFieldsUsingUniqueName.Samlevende_Skaltestamentetbortfaldevedsamlivetsophr.isVisible = false;
            showHideFieldsUsingUniqueName.Samlevende_Skaltestamentetbortfaldevedsamlivetsophr.isMandatory = false;
            showHideFieldsUsingUniqueName.Samlevende_Skaltestamentetbortfaldevedsamlivetsophr.hasError = false;


            showHideFieldsUsingUniqueName.Samlevende_rstalforhvornrdeflyttedesammen = {};
            showHideFieldsUsingUniqueName.Samlevende_rstalforhvornrdeflyttedesammen.isVisible = false;
            showHideFieldsUsingUniqueName.Samlevende_rstalforhvornrdeflyttedesammen.isMandatory = false;
            showHideFieldsUsingUniqueName.Samlevende_rstalforhvornrdeflyttedesammen.hasError = false;


            showHideFieldsUsingUniqueName.Samlevende_Benytrstalistedetfordato = {};
            showHideFieldsUsingUniqueName.Samlevende_Benytrstalistedetfordato.isVisible = false;
            showHideFieldsUsingUniqueName.Samlevende_Benytrstalistedetfordato.isMandatory = false;
            showHideFieldsUsingUniqueName.Samlevende_Benytrstalistedetfordato.hasError = false;


            showHideFieldsUsingUniqueName.Samlevende_Datoforhvornrdeflyttedesammen = {};
            showHideFieldsUsingUniqueName.Samlevende_Datoforhvornrdeflyttedesammen.isVisible = false;
            showHideFieldsUsingUniqueName.Samlevende_Datoforhvornrdeflyttedesammen.isMandatory = false;
            showHideFieldsUsingUniqueName.Samlevende_Datoforhvornrdeflyttedesammen.hasError = false;


            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Hvisjahvormeget = {};
            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Hvisjahvormeget.isVisible = false;
            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Hvisjahvormeget.isMandatory = false;
            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Hvisjahvormeget.hasError = false;


            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Skalfuldmgtigehaveadgangtiletrligthonorar = {};
            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Skalfuldmgtigehaveadgangtiletrligthonorar.isVisible = false;
            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Skalfuldmgtigehaveadgangtiletrligthonorar.isMandatory = false;
            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Skalfuldmgtigehaveadgangtiletrligthonorar.hasError = false;


            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Afgiftsfriegaver = {};
            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Afgiftsfriegaver.isVisible = false;
            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Afgiftsfriegaver.isMandatory = false;
            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Afgiftsfriegaver.hasError = false;


            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Gavertilfuldmagtshaverselv = {};
            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Gavertilfuldmagtshaverselv.isVisible = false;
            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Gavertilfuldmagtshaverselv.isMandatory = false;
            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Gavertilfuldmagtshaverselv.hasError = false;


            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Gavertilvelgrenhed = {};
            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Gavertilvelgrenhed.isVisible = false;
            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Gavertilvelgrenhed.isMandatory = false;
            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Gavertilvelgrenhed.hasError = false;


            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Virksomhed = {};
            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Virksomhed.isVisible = false;
            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Virksomhed.isMandatory = false;
            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Virksomhed.hasError = false;


            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_konomiskeforhold = {};
            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_konomiskeforhold.isVisible = false;
            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_konomiskeforhold.isMandatory = false;
            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_konomiskeforhold.hasError = false;


            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Personligeforhold = {};
            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Personligeforhold.isVisible = false;
            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Personligeforhold.isMandatory = false;
            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Personligeforhold.hasError = false;


            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Skalderindsttesandrefuldmgteendgensidige = {};
            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Skalderindsttesandrefuldmgteendgensidige.isVisible = false;
            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Skalderindsttesandrefuldmgteendgensidige.isMandatory = false;
            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Skalderindsttesandrefuldmgteendgensidige.hasError = false;

            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Skalsekundrefuldmgtigestiforeningiellerprioriteretrkeflge = {};
            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Skalsekundrefuldmgtigestiforeningiellerprioriteretrkeflge.isVisible = false;
            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Skalsekundrefuldmgtigestiforeningiellerprioriteretrkeflge.isMandatory = false;
            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Skalsekundrefuldmgtigestiforeningiellerprioriteretrkeflge.hasError = false;


            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Erdet2gensidigefuldmagter = {};
            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Erdet2gensidigefuldmagter.isVisible = false;
            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Erdet2gensidigefuldmagter.isMandatory = false;
            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Erdet2gensidigefuldmagter.hasError = false;


            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Skalderkunnegiveslejlighedsgaver = {};
            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Skalderkunnegiveslejlighedsgaver.isVisible = false;
            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Skalderkunnegiveslejlighedsgaver.isMandatory = false;
            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Skalderkunnegiveslejlighedsgaver.hasError = false;


            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Skalderkunnegivessdvanligegaver = {};
            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Skalderkunnegivessdvanligegaver.isVisible = false;
            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Skalderkunnegivessdvanligegaver.isMandatory = false;
            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Skalderkunnegivessdvanligegaver.hasError = false;


            showHideFieldsUsingUniqueName.Bornetestamente_MnedligtprBarn = {};
            showHideFieldsUsingUniqueName.Bornetestamente_MnedligtprBarn.isVisible = false;
            showHideFieldsUsingUniqueName.Bornetestamente_MnedligtprBarn.isMandatory = false;
            showHideFieldsUsingUniqueName.Bornetestamente_MnedligtprBarn.hasError = false;


            showHideFieldsUsingUniqueName.Bonetestamente_Engangsbelbtilvrgen = {};
            showHideFieldsUsingUniqueName.Bonetestamente_Engangsbelbtilvrgen.isVisible = false;
            showHideFieldsUsingUniqueName.Bonetestamente_Engangsbelbtilvrgen.isManadatory = false;
            showHideFieldsUsingUniqueName.Bonetestamente_Engangsbelbtilvrgen.hasError = false;


            showHideFieldsUsingUniqueName.Bndlggelse_Betingelser = {};
            showHideFieldsUsingUniqueName.Bndlggelse_Betingelser.isVisible = false;
            showHideFieldsUsingUniqueName.Bndlggelse_Betingelser.isManadatory = false;
            showHideFieldsUsingUniqueName.Bndlggelse_Betingelser.hasError = false;

            showHideFieldsUsingUniqueName.Bndlggelse_Skalerindsttessrligebetingelseribndlggelsestiden = {};
            showHideFieldsUsingUniqueName.Bndlggelse_Skalerindsttessrligebetingelseribndlggelsestiden.isVisible = false;
            showHideFieldsUsingUniqueName.Bndlggelse_Skalerindsttessrligebetingelseribndlggelsestiden.isManadatory = false;
            showHideFieldsUsingUniqueName.Bndlggelse_Skalerindsttessrligebetingelseribndlggelsestiden.hasError = false;


            showHideFieldsUsingUniqueName.Bndlggelse_Bndlggelsesalder = {};
            showHideFieldsUsingUniqueName.Bndlggelse_Bndlggelsesalder.isVisible = false;
            showHideFieldsUsingUniqueName.Bndlggelse_Bndlggelsesalder.isMandatory = false;
            showHideFieldsUsingUniqueName.Bndlggelse_Bndlggelsesalder.hasError = false;


            showHideFieldsUsingUniqueName.Sreje_Yderligeresrejebetingelser = {};
            showHideFieldsUsingUniqueName.Sreje_Yderligeresrejebetingelser.isVisible = false;
            showHideFieldsUsingUniqueName.Sreje_Yderligeresrejebetingelser.isMandatory = false;
            showHideFieldsUsingUniqueName.Sreje_Yderligeresrejebetingelser.hasError = false;


            showHideFieldsUsingUniqueName.Sreje_Srejeform = {};
            showHideFieldsUsingUniqueName.Sreje_Srejeform.isVisible = false;
            showHideFieldsUsingUniqueName.Sreje_Srejeform.isMandatory = false;
            showHideFieldsUsingUniqueName.Sreje_Srejeform.hasError = false;





            showHideFieldsUsingUniqueName.Arvefordeling_Taghjdeforfremtidigebrn = {};
            showHideFieldsUsingUniqueName.Arvefordeling_Taghjdeforfremtidigebrn.isVisible = false;
            showHideFieldsUsingUniqueName.Arvefordeling_Taghjdeforfremtidigebrn.isMandatory = false;
            showHideFieldsUsingUniqueName.Arvefordeling_Taghjdeforfremtidigebrn.hasError = false;

            showHideFieldsUsingUniqueName.Arvefordeling_TaghjdeforfremtidigebrnSecondIncludeFutureChildren = {};
            showHideFieldsUsingUniqueName.Arvefordeling_TaghjdeforfremtidigebrnSecondIncludeFutureChildren.isVisible = false;
            showHideFieldsUsingUniqueName.Arvefordeling_TaghjdeforfremtidigebrnSecondIncludeFutureChildren.isMandatory = false;
            showHideFieldsUsingUniqueName.Arvefordeling_TaghjdeforfremtidigebrnSecondIncludeFutureChildren.hasError = false;

            showHideFieldsUsingUniqueName.Arvefordeling_Vlgarvefordelingefterfrsteafdde = {};
            showHideFieldsUsingUniqueName.Arvefordeling_Vlgarvefordelingefterfrsteafdde.isVisible = false;
            showHideFieldsUsingUniqueName.Arvefordeling_Vlgarvefordelingefterfrsteafdde.isMandatory = false;
            showHideFieldsUsingUniqueName.Arvefordeling_Vlgarvefordelingefterfrsteafdde.hasError = false;

            showHideFieldsUsingUniqueName.Arvefordeling_Arv = {};
            showHideFieldsUsingUniqueName.Arvefordeling_Arv.isVisible = false;
            showHideFieldsUsingUniqueName.Arvefordeling_Arv.isMandatory = false;
            showHideFieldsUsingUniqueName.Arvefordeling_Arv.hasError = false;


            showHideFieldsUsingUniqueName.Arvefordeling_Arvefterfrsteafdde = {};
            showHideFieldsUsingUniqueName.Arvefordeling_Arvefterfrsteafdde.isVisible = false;
            showHideFieldsUsingUniqueName.Arvefordeling_Arvefterfrsteafdde.isMandatory = false;
            showHideFieldsUsingUniqueName.Arvefordeling_Arvefterfrsteafdde.hasError = false;

            showHideFieldsUsingUniqueName.Arvefordeling_Vlgarvefordelingefterlngstlevende = {};
            showHideFieldsUsingUniqueName.Arvefordeling_Vlgarvefordelingefterlngstlevende.isVisible = false;
            showHideFieldsUsingUniqueName.Arvefordeling_Vlgarvefordelingefterlngstlevende.isMandatory = false;
            showHideFieldsUsingUniqueName.Arvefordeling_Vlgarvefordelingefterlngstlevende.hasError = false;


            showHideFieldsUsingUniqueName.Arvefordeling_nskesgravstedsvedligeholdelseAnbefalesuanset = {};
            showHideFieldsUsingUniqueName.Arvefordeling_nskesgravstedsvedligeholdelseAnbefalesuanset.isVisible = false;
            showHideFieldsUsingUniqueName.Arvefordeling_nskesgravstedsvedligeholdelseAnbefalesuanset.isMandatory = false;
            showHideFieldsUsingUniqueName.Arvefordeling_nskesgravstedsvedligeholdelseAnbefalesuanset.hasError = false;


            showHideFieldsUsingUniqueName.Arvefordeling_Andetogelleruddybelse = {};
            showHideFieldsUsingUniqueName.Arvefordeling_Andetogelleruddybelse.isVisible = false;
            showHideFieldsUsingUniqueName.Arvefordeling_Andetogelleruddybelse.isMandatory = false;
            showHideFieldsUsingUniqueName.Arvefordeling_Andetogelleruddybelse.hasError = false;


            showHideFieldsUsingUniqueName.Perosn2_Email = {};
            showHideFieldsUsingUniqueName.Perosn2_Email.isVisible = false;
            showHideFieldsUsingUniqueName.Perosn2_Email.isMandatory = false;
            showHideFieldsUsingUniqueName.Perosn2_Email.hasError = false;


            showHideFieldsUsingUniqueName.Person2_Telefonnummer = {};
            showHideFieldsUsingUniqueName.Person2_Telefonnummer.isVisible = false;
            showHideFieldsUsingUniqueName.Person2_Telefonnummer.isMandatory = false;
            showHideFieldsUsingUniqueName.Person2_Telefonnummer.hasError = false;

            showHideFieldsUsingUniqueName.Person2_Postnummer = {};
            showHideFieldsUsingUniqueName.Person2_Postnummer.isVisible = false;
            showHideFieldsUsingUniqueName.Person2_Postnummer.isMandatory = false;
            showHideFieldsUsingUniqueName.Person2_Postnummer.hasError = false;


            showHideFieldsUsingUniqueName.Person2_By = {};
            showHideFieldsUsingUniqueName.Person2_By.isVisible = false;
            showHideFieldsUsingUniqueName.Person2_By.isMandatory = false;
            showHideFieldsUsingUniqueName.Person2_By.hasError = false;


            showHideFieldsUsingUniqueName.Person2_Postnummer = {};
            showHideFieldsUsingUniqueName.Person2_Postnummer.isVisible = false;
            showHideFieldsUsingUniqueName.Person2_Postnummer.isMandatory = false;
            showHideFieldsUsingUniqueName.Person2_Postnummer.hasError = false;


            showHideFieldsUsingUniqueName.Person2_Adresse = {};
            showHideFieldsUsingUniqueName.Person2_Adresse.isVisible = false;
            showHideFieldsUsingUniqueName.Person2_Adresse.isMandatory = false;
            showHideFieldsUsingUniqueName.Person2_Adresse.hasError = false;

            showHideFieldsUsingUniqueName.Person2_UseSameAddressAsPerson1 = {};
            showHideFieldsUsingUniqueName.Person2_UseSameAddressAsPerson1.isVisible = false;
            showHideFieldsUsingUniqueName.Person2_UseSameAddressAsPerson1.isMandatory = false;
            showHideFieldsUsingUniqueName.Person2_UseSameAddressAsPerson1.hasError = false;


            showHideFieldsUsingUniqueName.Person2_CPR = {};
            showHideFieldsUsingUniqueName.Person2_CPR.isVisible = false;
            showHideFieldsUsingUniqueName.Person2_CPR.isMandatory = false;
            showHideFieldsUsingUniqueName.Person2_CPR.hasError = false;


            showHideFieldsUsingUniqueName.Person2_Efternavn = {};
            showHideFieldsUsingUniqueName.Person2_Efternavn.isVisible = false;
            showHideFieldsUsingUniqueName.Person2_Efternavn.isMandatory = false;
            showHideFieldsUsingUniqueName.Person2_Efternavn.hasError = false;


            showHideFieldsUsingUniqueName.Person2_Fornavn = {};
            showHideFieldsUsingUniqueName.Person2_Fornavn.isVisible = false;
            showHideFieldsUsingUniqueName.Person2_Fornavn.isMandatory = false;
            showHideFieldsUsingUniqueName.Person2_Fornavn.hasError = false;




            showHideFieldsUsingUniqueName.gteskab_YearOfMarriage = {};
            showHideFieldsUsingUniqueName.gteskab_YearOfMarriage.isVisible = false;
            showHideFieldsUsingUniqueName.gteskab_YearOfMarriage.isMandatory = false;
            showHideFieldsUsingUniqueName.gteskab_YearOfMarriage.hasError = false;


            showHideFieldsUsingUniqueName.gteskab_Lngstlevendestestationsret = {};
            showHideFieldsUsingUniqueName.gteskab_Lngstlevendestestationsret.isVisible = false;
            showHideFieldsUsingUniqueName.gteskab_Lngstlevendestestationsret.isMandatory = false;
            showHideFieldsUsingUniqueName.gteskab_Lngstlevendestestationsret.hasError = false;


            showHideFieldsUsingUniqueName.gteskab_Skaltilbagekaldelseellerndringkrvesamtykkefrabeggeparter = {};
            showHideFieldsUsingUniqueName.gteskab_Skaltilbagekaldelseellerndringkrvesamtykkefrabeggeparter.isVisible = false;
            showHideFieldsUsingUniqueName.gteskab_Skaltilbagekaldelseellerndringkrvesamtykkefrabeggeparter.isMandatory = false;
            showHideFieldsUsingUniqueName.gteskab_Skaltilbagekaldelseellerndringkrvesamtykkefrabeggeparter.hasError = false;


            showHideFieldsUsingUniqueName.gteskab_Sidderduellerdingteflleiuskiftetbo = {};
            showHideFieldsUsingUniqueName.gteskab_Sidderduellerdingteflleiuskiftetbo.isVisible = false;
            showHideFieldsUsingUniqueName.gteskab_Sidderduellerdingteflleiuskiftetbo.isMandatory = false;
            showHideFieldsUsingUniqueName.gteskab_Sidderduellerdingteflleiuskiftetbo.hasError = false;


            showHideFieldsUsingUniqueName.gteskab_Ejerifastejendomellerandetsammen = {};
            showHideFieldsUsingUniqueName.gteskab_Ejerifastejendomellerandetsammen.isVisible = false;
            showHideFieldsUsingUniqueName.gteskab_Ejerifastejendomellerandetsammen.isMandatory = false;
            showHideFieldsUsingUniqueName.gteskab_Ejerifastejendomellerandetsammen.hasError = false;

            showHideFieldsUsingUniqueName.gteskab_Skaltestamentetfortsatgldehvislngstlevendeblivetgift = {};
            showHideFieldsUsingUniqueName.gteskab_Skaltestamentetfortsatgldehvislngstlevendeblivetgift.isVisible = false;
            showHideFieldsUsingUniqueName.gteskab_Skaltestamentetfortsatgldehvislngstlevendeblivetgift.isMandatory = false;
            showHideFieldsUsingUniqueName.gteskab_Skaltestamentetfortsatgldehvislngstlevendeblivetgift.hasError = false;


            showHideFieldsUsingUniqueName.gteskab_Skalbestemmelserderomhandlerbrneneandrearvingevedvare = {};
            showHideFieldsUsingUniqueName.gteskab_Skalbestemmelserderomhandlerbrneneandrearvingevedvare.isVisible = false;
            showHideFieldsUsingUniqueName.gteskab_Skalbestemmelserderomhandlerbrneneandrearvingevedvare.isMandatory = false;
            showHideFieldsUsingUniqueName.gteskab_Skalbestemmelserderomhandlerbrneneandrearvingevedvare.hasError = false;

            showHideFieldsUsingUniqueName.gteskab_Skaltestamentetbortfaldevedgteskabetsophr = {};
            showHideFieldsUsingUniqueName.gteskab_Skaltestamentetbortfaldevedgteskabetsophr.isVisible = false;
            showHideFieldsUsingUniqueName.gteskab_Skaltestamentetbortfaldevedgteskabetsophr.isMandatory = false;
            showHideFieldsUsingUniqueName.gteskab_Skaltestamentetbortfaldevedgteskabetsophr.hasError = false;


            showHideFieldsUsingUniqueName.gteskab_marriageType = {};
            showHideFieldsUsingUniqueName.gteskab_marriageType.isVisible = false;
            showHideFieldsUsingUniqueName.gteskab_marriageType.isMandatory = false;
            showHideFieldsUsingUniqueName.gteskab_marriageType.hasError = false;


            showHideFieldsUsingUniqueName.gteskab_marriageDate = {};
            showHideFieldsUsingUniqueName.gteskab_marriageDate.isVisible = false;
            showHideFieldsUsingUniqueName.gteskab_marriageDate.isMandatory = false;
            showHideFieldsUsingUniqueName.gteskab_marriageDate.hasError = false;


            showHideFieldsUsingUniqueName.gteskab_UseYearInsteadOfDate = {};
            showHideFieldsUsingUniqueName.gteskab_UseYearInsteadOfDate.isVisible = false;
            showHideFieldsUsingUniqueName.gteskab_UseYearInsteadOfDate.isMandatory = false;
            showHideFieldsUsingUniqueName.gteskab_UseYearInsteadOfDate.hasError = false;

            showHideFieldsUsingUniqueName.gteskab_Skallngstlevendemodtagearvensomsreje = {};
            showHideFieldsUsingUniqueName.gteskab_Skallngstlevendemodtagearvensomsreje.isVisible = false;
            showHideFieldsUsingUniqueName.gteskab_Skallngstlevendemodtagearvensomsreje.isMandatory = false;
            showHideFieldsUsingUniqueName.gteskab_Skallngstlevendemodtagearvensomsreje.hasError = false;


            showHideFieldsUsingUniqueName.Person1_Email = {};
            showHideFieldsUsingUniqueName.Person1_Email.isVisible = false;
            showHideFieldsUsingUniqueName.Person1_Email.isMandatory = false;
            showHideFieldsUsingUniqueName.Person1_Email.hasError = false;


            showHideFieldsUsingUniqueName.Person1_Phone = {};
            showHideFieldsUsingUniqueName.Person1_Phone.isVisible = false;
            showHideFieldsUsingUniqueName.Person1_Phone.isMandatory = false;
            showHideFieldsUsingUniqueName.Person1_Phone.hasError = false;


            showHideFieldsUsingUniqueName.Person1_City = {};
            showHideFieldsUsingUniqueName.Person1_City.isVisible = false;
            showHideFieldsUsingUniqueName.Person1_City.isMandatory = false;
            showHideFieldsUsingUniqueName.Person1_City.hasError = false;


            showHideFieldsUsingUniqueName.Person1_Address = {};
            showHideFieldsUsingUniqueName.Person1_Address.isVisible = false;
            showHideFieldsUsingUniqueName.Person1_Address.isMandatory = false;
            showHideFieldsUsingUniqueName.Person1_Address.hasError = false;


            showHideFieldsUsingUniqueName.Person1_Zip = {};
            showHideFieldsUsingUniqueName.Person1_Zip.isVisible = false;
            showHideFieldsUsingUniqueName.Person1_Zip.isMandatory = false;
            showHideFieldsUsingUniqueName.Person1_Zip.hasError = false;


            showHideFieldsUsingUniqueName.Person1_CPR = {};
            showHideFieldsUsingUniqueName.Person1_CPR.isVisible = false;
            showHideFieldsUsingUniqueName.Person1_CPR.isMandatory = false;
            showHideFieldsUsingUniqueName.Person1_CPR.hasError = false;


            showHideFieldsUsingUniqueName.Person1_FirstName = {};
            showHideFieldsUsingUniqueName.Person1_FirstName.isVisible = false;
            showHideFieldsUsingUniqueName.Person1_FirstName.isMandatory = false;
            showHideFieldsUsingUniqueName.Person1_FirstName.hasError = false;


            showHideFieldsUsingUniqueName.Person1_LastName = {};
            showHideFieldsUsingUniqueName.Person1_LastName.isVisible = false;
            showHideFieldsUsingUniqueName.Person1_LastName.isMandatory = false;
            showHideFieldsUsingUniqueName.Person1_LastName.hasError = false;


            showHideFieldsUsingUniqueName.CivilStatus = {};
            showHideFieldsUsingUniqueName.CivilStatus.isVisible = false;
            showHideFieldsUsingUniqueName.CivilStatus.isMandatory = false;
            showHideFieldsUsingUniqueName.CivilStatus.hasError = false;

            showHideFieldsUsingUniqueName.PreQuestioning = {};
            showHideFieldsUsingUniqueName.PreQuestioning.isVisible = false;
            showHideFieldsUsingUniqueName.PreQuestioning.isMandatory = false;
            showHideFieldsUsingUniqueName.PreQuestioning.hasError = false;


            showHideFieldsUsingUniqueName.Samlevende = {};
            showHideFieldsUsingUniqueName.Samlevende.isVisible = false;
            showHideFieldsUsingUniqueName.Samlevende.isMandatory = false;
            showHideFieldsUsingUniqueName.Samlevende.hasError = false;


            showHideFieldsUsingUniqueName.Fremtidsfuldmagt = {};
            showHideFieldsUsingUniqueName.Fremtidsfuldmagt.isVisible = false;
            showHideFieldsUsingUniqueName.Fremtidsfuldmagt.isMandatory = false;
            showHideFieldsUsingUniqueName.Fremtidsfuldmagt.hasError = false;


            showHideFieldsUsingUniqueName.Guardian = {};
            showHideFieldsUsingUniqueName.Guardian.isVisible = false;
            showHideFieldsUsingUniqueName.Guardian.isMandatory = false;
            showHideFieldsUsingUniqueName.Guardian.hasError = false;


            showHideFieldsUsingUniqueName.Escrow_Condition = {};
            showHideFieldsUsingUniqueName.Escrow_Condition.isVisible = false;
            showHideFieldsUsingUniqueName.Escrow_Condition.isMandatory = false;
            showHideFieldsUsingUniqueName.Escrow_Condition.hasError = false;


            showHideFieldsUsingUniqueName.Seperate_property_type_and_conditions = {};
            showHideFieldsUsingUniqueName.Seperate_property_type_and_conditions.isVisible = false;
            showHideFieldsUsingUniqueName.Seperate_property_type_and_conditions.isMandatory = false;
            showHideFieldsUsingUniqueName.Seperate_property_type_and_conditions.hasError = false;


            showHideFieldsUsingUniqueName.Arvefordeling = {};
            showHideFieldsUsingUniqueName.Arvefordeling.isVisible = false;
            showHideFieldsUsingUniqueName.Arvefordeling.isMandatory = false;
            showHideFieldsUsingUniqueName.Arvefordeling.hasError = false;


            showHideFieldsUsingUniqueName.Marriage = {};
            showHideFieldsUsingUniqueName.Marriage.isVisible = false;
            showHideFieldsUsingUniqueName.Marriage.isMandatory = false;
            showHideFieldsUsingUniqueName.Marriage.hasError = false;


            showHideFieldsUsingUniqueName.Person_2 = {};
            showHideFieldsUsingUniqueName.Person_2.isVisible = false;
            showHideFieldsUsingUniqueName.Person_2.isMandatory = false;
            showHideFieldsUsingUniqueName.Person_2.hasError = false;


            showHideFieldsUsingUniqueName.Person_1 = {};
            showHideFieldsUsingUniqueName.Person_1.isVisible = false;
            showHideFieldsUsingUniqueName.Person_1.isMandatory = false;
            showHideFieldsUsingUniqueName.Person_1.hasError = false;


            showHideFieldsUsingUniqueName.Legater = {};
            showHideFieldsUsingUniqueName.Legater.isVisible = false;
            showHideFieldsUsingUniqueName.Legater.isMandatory = false;
            showHideFieldsUsingUniqueName.Legater.hasError = false;

            showHideFieldsUsingUniqueName.Legater = {};
            showHideFieldsUsingUniqueName.Legater.isVisible = false;
            showHideFieldsUsingUniqueName.Legater.isMandatory = false;
            showHideFieldsUsingUniqueName.Legater.hasError = false;

            /*For showing Asset Money Section*/
            showHideFieldsUsingUniqueName.Sumlegat = {};
            showHideFieldsUsingUniqueName.Sumlegat.isVisible = false;
            showHideFieldsUsingUniqueName.Sumlegat.isMandatory = false;
            showHideFieldsUsingUniqueName.Sumlegat.hasError = false;

            /*For Showing Asset Thing Section*/
            showHideFieldsUsingUniqueName.Genstandslegat = {};
            showHideFieldsUsingUniqueName.Genstandslegat.isVisible = false;
            showHideFieldsUsingUniqueName.Genstandslegat.isMandatory = false;
            showHideFieldsUsingUniqueName.Genstandslegat.hasError = false;


            showHideFieldsUsingUniqueName.Children = {};
            showHideFieldsUsingUniqueName.Children.isVisible = false;
            showHideFieldsUsingUniqueName.Children.isMandatory = false;
            showHideFieldsUsingUniqueName.Children.hasError = false;

            /*New changes ShubhamK*/
            showHideFieldsUsingUniqueName.Person1_InternalNotes = {};
            showHideFieldsUsingUniqueName.Person1_InternalNotes.isVisible = false;
            showHideFieldsUsingUniqueName.Person1_InternalNotes.isMandatory = false;
            showHideFieldsUsingUniqueName.Person1_InternalNotes.hasError = false;

            showHideFieldsUsingUniqueName.Person2_InternalNotes = {};
            showHideFieldsUsingUniqueName.Person2_InternalNotes.isVisible = false;
            showHideFieldsUsingUniqueName.Person2_InternalNotes.isMandatory = false;
            showHideFieldsUsingUniqueName.Person2_InternalNotes.hasError = false;

            showHideFieldsUsingUniqueName.Samlevende_InternalNotes = {};
            showHideFieldsUsingUniqueName.Samlevende_InternalNotes.isVisible = false;
            showHideFieldsUsingUniqueName.Samlevende_InternalNotes.isMandatory = false;
            showHideFieldsUsingUniqueName.Samlevende_InternalNotes.hasError = false;

            showHideFieldsUsingUniqueName.Samlevende_SkaltestamentetfortsatgldehvisIblivergift = {};
            showHideFieldsUsingUniqueName.Samlevende_SkaltestamentetfortsatgldehvisIblivergift.isVisible = false;
            showHideFieldsUsingUniqueName.Samlevende_SkaltestamentetfortsatgldehvisIblivergift.isMandatory = false;
            showHideFieldsUsingUniqueName.Samlevende_SkaltestamentetfortsatgldehvisIblivergift.hasError = false;

            showHideFieldsUsingUniqueName.gteskab_InternalNotes = {};
            showHideFieldsUsingUniqueName.gteskab_InternalNotes.isVisible = false;
            showHideFieldsUsingUniqueName.gteskab_InternalNotes.isMandatory = false;
            showHideFieldsUsingUniqueName.gteskab_InternalNotes.hasError = false;

            showHideFieldsUsingUniqueName.Brn_InternalNotes = {};
            showHideFieldsUsingUniqueName.Brn_InternalNotes.isVisible = false;
            showHideFieldsUsingUniqueName.Brn_InternalNotes.isMandatory = false;
            showHideFieldsUsingUniqueName.Brn_InternalNotes.hasError = false;

            showHideFieldsUsingUniqueName.Arvefordeling_InternalNotes = {};
            showHideFieldsUsingUniqueName.Arvefordeling_InternalNotes.isVisible = false;
            showHideFieldsUsingUniqueName.Arvefordeling_InternalNotes.isMandatory = false;
            showHideFieldsUsingUniqueName.Arvefordeling_InternalNotes.hasError = false;

            showHideFieldsUsingUniqueName.Legater_InternalNotes = {};
            showHideFieldsUsingUniqueName.Legater_InternalNotes.isVisible = false;
            showHideFieldsUsingUniqueName.Legater_InternalNotes.isMandatory = false;
            showHideFieldsUsingUniqueName.Legater_InternalNotes.hasError = false;

            showHideFieldsUsingUniqueName.Sreje_InternalNotes = {};
            showHideFieldsUsingUniqueName.Sreje_InternalNotes.isVisible = false;
            showHideFieldsUsingUniqueName.Sreje_InternalNotes.isMandatory = false;
            showHideFieldsUsingUniqueName.Sreje_InternalNotes.hasError = false;

            showHideFieldsUsingUniqueName.Bndlggelse_InternalNotes = {};
            showHideFieldsUsingUniqueName.Bndlggelse_InternalNotes.isVisible = false;
            showHideFieldsUsingUniqueName.Bndlggelse_InternalNotes.isMandatory = false;
            showHideFieldsUsingUniqueName.Bndlggelse_InternalNotes.hasError = false;

            showHideFieldsUsingUniqueName.Brnetestamente_InternalNotes = {};
            showHideFieldsUsingUniqueName.Brnetestamente_InternalNotes.isVisible = false;
            showHideFieldsUsingUniqueName.Brnetestamente_InternalNotes.isMandatory = false;
            showHideFieldsUsingUniqueName.Brnetestamente_InternalNotes.hasError = false;

            showHideFieldsUsingUniqueName.Brnetestamente_Skalderindsttesenunsketvrge = {};
            showHideFieldsUsingUniqueName.Brnetestamente_Skalderindsttesenunsketvrge.isVisible = false;
            showHideFieldsUsingUniqueName.Brnetestamente_Skalderindsttesenunsketvrge.isMandatory = false;
            showHideFieldsUsingUniqueName.Brnetestamente_Skalderindsttesenunsketvrge.hasError = false;

            showHideFieldsUsingUniqueName.Brnetestamente_Skalvrgenhaveadgangtiletbelb = {};
            showHideFieldsUsingUniqueName.Brnetestamente_Skalvrgenhaveadgangtiletbelb.isVisible = false;
            showHideFieldsUsingUniqueName.Brnetestamente_Skalvrgenhaveadgangtiletbelb.isMandatory = false;
            showHideFieldsUsingUniqueName.Brnetestamente_Skalvrgenhaveadgangtiletbelb.hasError = false;

            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_InternalNotes = {};
            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_InternalNotes.isVisible = false;
            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_InternalNotes.isMandatory = false;
            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_InternalNotes.hasError = false;

            showHideFieldsUsingUniqueName.Sumlegat_InternalNotes = {};
            showHideFieldsUsingUniqueName.Sumlegat_InternalNotes.isVisible = false;
            showHideFieldsUsingUniqueName.Sumlegat_InternalNotes.isMandatory = false;
            showHideFieldsUsingUniqueName.Sumlegat_InternalNotes.hasError = false;

            showHideFieldsUsingUniqueName.Genstandslegat_InternalNotes = {};
            showHideFieldsUsingUniqueName.Genstandslegat_InternalNotes.isVisible = false;
            showHideFieldsUsingUniqueName.Genstandslegat_InternalNotes.isMandatory = false;
            showHideFieldsUsingUniqueName.Genstandslegat_InternalNotes.hasError = false;


            c.set("v.showHideFieldsUsingUniqueName", showHideFieldsUsingUniqueName);
            // Changes for ticket - DIN-169 : Open record content in form.
            // Start
            // Description : shoing form when isOpenJournalFormClicked is true.
            let isOpenJournalFormClicked = c.get("v.isOpenJournalFormClicked");

            let action = c.get("c.getJournalData_Apex");
            action.setParams({
                'JournalId': c.get("v.journalId"),
                'objectName': objectName,
                'leadId': c.get("v.leadId"),
                'journlaFormClicked': isOpenJournalFormClicked
            });
            action.setCallback(this, function(r) {
                if (r.getState() === 'SUCCESS') {
                    let storedResponse = r.getReturnValue();
                    if (storedResponse && Object.keys(storedResponse).length > 0) {
                        // Changes for ticket - DIN-169 : Open record content in form.
                        // Start
                        // Description : checking for the url in docFabUrl property.

                        if (isOpenJournalFormClicked) {
                            let docFabUrl = storedResponse.docFabUrl;
                            if (docFabUrl) {
                                if (docFabUrl.includes("Current user with") || docFabUrl.includes("No form configuration found") || docFabUrl.includes("Can not open") || docFabUrl.includes("Can not create") || docFabUrl.includes("Error")) {
                                    // h.showErrorToast(c, e, h, docFabUrl);
                                    // Changes for ticket DIN-254 : Add "OK" button to docfab error toast and include status message from api service
                                    // Start
                                    let toastEvent = $A.get("e.force:showToast");
                                    toastEvent.setParams({
                                        title: 'Error Message',
                                        mode: 'sticky',
                                        message: docFabUrl,
                                        messageTemplate: docFabUrl,
                                        type: 'error',
                                        key: 'info_alt',
                                        duration: ' 5000',
                                    });
                                    toastEvent.fire();
                                    // End
                                } else {
                                    c.set("v.docFabFormUrl", storedResponse.docFabUrl);
                                    c.set("v.openDocFabForm", true);
                                }
                                c.set("v.closeModal", false);

                            }
                        }
                        // End
                        let allPicklistValue = {};
                        let mariageTypePicklistArray = [];
                        let editRecallPicklistArray = [];
                        let civilStatusPicklistArray = [];
                        let separatePropertyTypePicklistArray = [];
                        let inheritenseLongestLivedTypePicklistArray = [];
                        let inheritenseFromFisrtTypePicklistArray = [];
                        let lastSurvivingConditionsPicklistArray = [];
                        let JournalStatesPicklistArray = [];
                        //DFJ-160
                        let JournalRetskredsPicklistArray = [];
                        //End
                        c.set("v.userList", storedResponse.userList);

                        let TypePicklistObjectArray = [];
                        storedResponse.picklistWrappersEventValues.forEach(function(ele) {
                            if (ele.fieldName === 'Type') {
                                ele.multiplepicklist.forEach(function(ele) {
                                    let TypePicklistObject = {};
                                    TypePicklistObject.label = ele.Label;
                                    TypePicklistObject.value = ele.value;
                                    TypePicklistObjectArray.push(TypePicklistObject);
                                });
                            }
                        });
                        c.set("v.EventTypePicklistValue", TypePicklistObjectArray);

                        storedResponse.picklistWrappersValues.forEach(function(ele) {
                            if (ele.fieldName === 'mariage_type__c') {
                                ele.multiplepicklist.forEach(function(ele) {
                                    let mariageTypePicklistObject = {};
                                    mariageTypePicklistObject.label = ele.Label;
                                    mariageTypePicklistObject.value = ele.value;
                                    mariageTypePicklistArray.push(mariageTypePicklistObject);
                                });
                            } else if (ele.fieldName === 'edit_or_recall__c') {
                                ele.multiplepicklist.forEach(function(ele) {
                                    let editRecallPicklistObject = {};
                                    editRecallPicklistObject.label = ele.Label;
                                    editRecallPicklistObject.value = ele.value;
                                    editRecallPicklistArray.push(editRecallPicklistObject);
                                });
                            } else if (ele.fieldName === 'civil_status__c') {
                                ele.multiplepicklist.forEach(function(ele) {
                                    let civilStatusPicklistObject = {};
                                    civilStatusPicklistObject.label = ele.Label;
                                    civilStatusPicklistObject.value = ele.value;
                                    civilStatusPicklistArray.push(civilStatusPicklistObject);
                                });
                            } else if (ele.fieldName === 'separate_property_type__c') {
                                ele.multiplepicklist.forEach(function(ele) {
                                    let separatePropertyTypePicklistObject = {};
                                    separatePropertyTypePicklistObject.label = ele.Label;
                                    separatePropertyTypePicklistObject.value = ele.value;
                                    separatePropertyTypePicklistArray.push(separatePropertyTypePicklistObject);
                                });
                            } else if (ele.fieldName === 'inheritance_from_longest_lived__c') {
                                ele.multiplepicklist.forEach(function(ele) {
                                    let separatePropertyTypePicklistObject = {};
                                    separatePropertyTypePicklistObject.label = ele.Label;
                                    separatePropertyTypePicklistObject.value = ele.value;
                                    inheritenseLongestLivedTypePicklistArray.push(separatePropertyTypePicklistObject);
                                });
                            } else if (ele.fieldName === 'inheritance_from_first__c') {
                                ele.multiplepicklist.forEach(function(ele) {
                                    let separatePropertyTypePicklistObject = {};
                                    separatePropertyTypePicklistObject.label = ele.Label;
                                    separatePropertyTypePicklistObject.value = ele.value;
                                    inheritenseFromFisrtTypePicklistArray.push(separatePropertyTypePicklistObject);
                                });
                            } else if (ele.fieldName === 'last_surviving_conditions__c') {
                                ele.multiplepicklist.forEach(function(ele) {
                                    let lastSurvivingConditionPicklistObject = {};
                                    lastSurvivingConditionPicklistObject.label = ele.Label;
                                    lastSurvivingConditionPicklistObject.value = ele.value;
                                    lastSurvivingConditionsPicklistArray.push(lastSurvivingConditionPicklistObject);
                                });
                            } else if (ele.fieldName === 'Journal_States__c') {
                                ele.multiplepicklist.forEach(function(ele) {
                                    let lastSurvivingConditionPicklistObject = {};
                                    lastSurvivingConditionPicklistObject.label = ele.Label;
                                    lastSurvivingConditionPicklistObject.value = ele.value;
                                    JournalStatesPicklistArray.push(lastSurvivingConditionPicklistObject);
                                });
                            } else if (ele.fieldName === 'Retskreds__c') {//DFJ-60 changes
                                ele.multiplepicklist.forEach(function(ele) {
                                    let RetskredsPicklistObject = {};
                                    RetskredsPicklistObject.label = ele.Label;
                                    RetskredsPicklistObject.value = ele.value;
                                    JournalRetskredsPicklistArray.push(RetskredsPicklistObject);
                                });
                            }
                        });

                        // Changes for ticket DIN-284 : Create type picklist field on journal and show in component.
                        // Start
                        let picklistWrappersJournalTypeValues = [];
                        storedResponse.picklistWrappersJournalTypeValues.forEach(function(ele) {
                            ele.multiplepicklist.forEach(function(ele) {
                                let JournalTypeValue = {};
                                JournalTypeValue.label = ele.Label;
                                JournalTypeValue.value = ele.value;
                                picklistWrappersJournalTypeValues.push(JournalTypeValue);
                            });
                        });
                    
                        //End
                        // c.set("v.picklistWrappersJournalTypeValues",picklistWrappersJournalTypeValues);
                        // End

                        allPicklistValue.civilStatusPicklistArray = civilStatusPicklistArray;
                        allPicklistValue.mariageTypePicklistArray = mariageTypePicklistArray;
                        allPicklistValue.editRecallPicklistArray = editRecallPicklistArray;
                        allPicklistValue.separatePropertyTypePicklistArray = separatePropertyTypePicklistArray;
                        allPicklistValue.inheritenseLongestLivedTypePicklistArray = inheritenseLongestLivedTypePicklistArray;
                        allPicklistValue.inheritenseFromFisrtTypePicklistArray = inheritenseFromFisrtTypePicklistArray;
                        allPicklistValue.lastSurvivingConditionsPicklistArray = lastSurvivingConditionsPicklistArray;
                        allPicklistValue.JournalStatesPicklistArray = JournalStatesPicklistArray;
                        allPicklistValue.picklistWrappersJournalTypeValues = picklistWrappersJournalTypeValues;
                        //DFJ-160 added Retskreds__c in allPicklistValue
                        allPicklistValue.JournalRetskredsPicklistArray = JournalRetskredsPicklistArray;
                        //End
                        c.set("v.allPicklistValue", allPicklistValue);

                        let childData = [];
                        let guardianData = [];
                        let unwantedGuardianData = [];
                        let hier1PersonData = [];
                        let hier2PersonData = [];
                        let procuratorData = [];
                        storedResponse.personData.forEach(function(ele) {

                            if (ele.Type__c === 'Spouse 1') {
                                c.set("v.spouse1Data", ele);
                            } else if (ele.Type__c === 'Spouse 2') {
                                c.set("v.spouse2Data", ele);
                            }
                            if (ele.Type__c === 'Unwanted Guardian') {
                                unwantedGuardianData.push(ele);
                            }
                            if (ele.Type__c === 'Guardian 1' || ele.Type__c === 'Guardian 2') {
                                if (ele.Guardian_type__c === 'Missing') {
                                    ele.Guardian_type__c = 'N/A';
                                }
                                guardianData.push(ele);
                            }
                            if (ele.Type__c === 'Child') {
                                childData.push(ele);
                            }
                            if (ele.Type__c === 'First_Heir (legetar)') {
                                hier1PersonData.push(ele);
                            }
                            if (ele.Type__c === 'Second_Heir (legatar)') {
                                hier2PersonData.push(ele);
                            }
                            if (ele.Type__c === 'Procurator') {
                                procuratorData.push(ele);
                            }
                        });

                        let childDataSpouse1 = [];
                        let childDataSpouse2 = [];
                        let childDataCommon = [];
                        storedResponse.personData.forEach(function(ele) {
                            if (ele.Parents__c === 'Spouse1' && ele.Type__c === 'Child') {
                                childDataSpouse1.push(ele);
                            } else if (ele.Parents__c === 'Spouse2' && ele.Type__c === 'Child') {
                                childDataSpouse2.push(ele);
                            } else if (ele.Parents__c === 'Both' && ele.Type__c === 'Child') {
                                childDataCommon.push(ele);
                            }
                        });

                        procuratorData.sort(function(a, b) {
                            return a.Priority__c - b.Priority__c;
                        })
                        hier1PersonData.forEach(function(ele) {
                            if (!$A.util.isUndefinedOrNull(ele.Second_Percentage__c)) {
                                if (ele.Second_Percentage__c.toString().includes('.')) {
                                    ele.Second_Percentage__c = ele.Second_Percentage__c.toString().replace('.', ',');
                                }
                            }
                        });

                        hier2PersonData.forEach(function(ele) {
                            if (!$A.util.isUndefinedOrNull(ele.Second_Percentage__c)) {
                                if (ele.Second_Percentage__c.toString().includes('.')) {
                                    ele.Second_Percentage__c = ele.Second_Percentage__c.toString().replace('.', ',');
                                }
                            }
                        });

                        childDataSpouse1.forEach(function(ele) {
                            if (!$A.util.isUndefinedOrNull(ele.First_Percentage__c)) {
                                if (ele.First_Percentage__c.toString().includes('.')) {
                                    ele.First_Percentage__c = ele.First_Percentage__c.toString().replace('.', ',');
                                }
                            }

                            if (!$A.util.isUndefinedOrNull(ele.First_Percentage_Of_Child__c)) {
                                if (ele.First_Percentage_Of_Child__c.toString().includes('.')) {
                                    ele.First_Percentage_Of_Child__c = ele.First_Percentage_Of_Child__c.toString().replace('.', ',');
                                }
                            }
                        });

                        childDataSpouse2.forEach(function(ele) {
                            if (!$A.util.isUndefinedOrNull(ele.First_Percentage__c)) {
                                if (ele.First_Percentage__c.toString().includes('.')) {
                                    ele.First_Percentage__c = ele.First_Percentage__c.toString().replace('.', ',');
                                }
                            }

                            if (!$A.util.isUndefinedOrNull(ele.First_Percentage_Of_Child__c)) {
                                if (ele.First_Percentage_Of_Child__c.toString().includes('.')) {
                                    ele.First_Percentage_Of_Child__c = ele.First_Percentage_Of_Child__c.toString().replace('.', ',');
                                }
                            }
                        });

                        childDataCommon.forEach(function(ele) {
                            if (!$A.util.isUndefinedOrNull(ele.First_Percentage__c)) {
                                if (ele.First_Percentage__c.toString().includes('.')) {
                                    ele.First_Percentage__c = ele.First_Percentage__c.toString().replace('.', ',');
                                }
                            }

                            if (!$A.util.isUndefinedOrNull(ele.First_Percentage_Of_Child__c)) {
                                if (ele.First_Percentage_Of_Child__c.toString().includes('.')) {
                                    ele.First_Percentage_Of_Child__c = ele.First_Percentage_Of_Child__c.toString().replace('.', ',');
                                }
                            }
                        });

                        c.set("v.childDatasp1", childDataSpouse1);
                        c.set("v.guardianData", guardianData);
                        c.set("v.unwantedGuardianData", unwantedGuardianData);
                        c.set("v.childDatasp2", childDataSpouse2);
                        c.set("v.childDataCommon", childDataCommon);
                        c.set("v.hierPersonData", hier1PersonData);
                        c.set("v.hier2PersonData", hier2PersonData);
                        c.set("v.childDataProcurator", procuratorData);
                        //changes DIN-383
                        //Start
                        let journalRecord =  storedResponse.journalData;
                        c.set("v.JournalRecordData", Object.assign({}, journalRecord));
                        
                        //End

                        let assetsMoneyData = [];
                        let assetsThingsData = [];
                        storedResponse.assestData.forEach(function(ele) {
                            if (ele.Type__c === 'Money') {
                                assetsMoneyData.push(ele);
                            } else if (ele.Type__c === 'Heirloom') {
                                assetsThingsData.push(ele);
                            }

                        });
                        c.set("v.assetMoney", assetsMoneyData);
                        c.set("v.assetThing", assetsThingsData);

                        // Change for ticket DIN-197 : Process document template feature
                        // Start
                        if (storedResponse.journalData && storedResponse.journalData.External_record_uuid__c && storedResponse.journalData.External_record_uuid__c.trim() !== '') {
                            c.set('v.disableProcessDocfabButton', false);
                        } else {
                            c.set('v.disableProcessDocfabButton', true);
                        }
                        // End

                        window.setTimeout(
                            $A.getCallback(function() {
                                if (storedResponse.configurationValues === undefined || storedResponse.configurationValues === null || storedResponse.configurationValues === '' || $A.util.isEmpty(storedResponse.configurationValues)) {
                                    c.set("v.isConfigurationEmpty", true);
                                } else {
                                    c.set("v.isConfigurationEmpty", false);
                                }

                                c.set("v.JournalData", storedResponse.journalData);
                                c.set("v.configurationData", storedResponse.configurationValues);
                                c.set('v.journalId', storedResponse.journalData.Id);
                                h.showSections_helper(c, e, h);
                                h.validateField(c, e, h);
                                h.hideSpinner_Helper(c, e);
                                //Changes DIN-383
                                //Start
                                let createJournalHistoryRecordOnLead = c.get('v.isCreateJournalHistoryOnLead');
                                let JournalData = c.get("v.JournalData");

                                if(createJournalHistoryRecordOnLead && JournalData){
                                    h.createRecordOfJournalHistoryonOpenJournal_helper(c,e,h);
                                }
                            }), 1500
                        );
                    } else {
                        // Changes for ticket - DIN-169 : Open record content in form.
                        // Start
                        // Description : Closing the modal when getting empty object from apex.
                        c.set("v.closeModal", false);
                        // End
                    }
                } else {
                    console.error('ERROR');
                    console.info(r.getError());
                }
            });
            $A.enqueueAction(action);

            // End
        } catch (ex) {
            console.log('Error in fetching the journal form--' + ex);
            h.hideSpinner_Helper(c, e);
        }
    },

    validateLeadGroupdata_Helper: function(c, e, h) {
        let allValid = c.find('leadGrpId').reduce(function(validSoFar, inputCmp) {
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        if (allValid) {
            h.SaveLeadGroupData_Helper(c, e, h);
        } else {

        }
    },


    insertData_helper: function(c, e, h) {
        try {
            h.validateField(c, e, h);
            let configurationData = c.get("v.configurationData");
            let counter = c.get("v.counter");
            let personDeleteList = c.get("v.PersonDeleteList");
            let AssetDeleteList = c.get("v.AssetDeleteList");
            let guardianDeleteList = c.get("v.GuardianDeleteList");
            let heirDeleteList = c.get("v.heirDeleteList");
            let childDataProcuratorDeleteList = c.get("v.childDataProcuratorDeleteList");

            let guardianList = [];
            let guardiandata = c.get("v.guardianData");
            guardiandata.forEach(function(ele) {
                ele.Type__c = 'Guardian 1';
                if (ele.Guardian_type__c === 'N/A') {
                    ele.Guardian_type__c = 'Missing';
                }
            });

            let JournalData = c.get("v.JournalData");
            JournalData.Total_Count__c = counter;
            let personsRecordList = [];
            let unwantedGuradianData = c.get("v.unwantedGuardianData");
            unwantedGuradianData.forEach(function(ele) {
                ele.Type__c = 'Unwanted Guardian';
                personsRecordList.push(ele);
            });
            let childDataProcurator = c.get("v.childDataProcurator");
            childDataProcurator.forEach(function(ele) {
                ele.Type__c = 'Procurator';
                personsRecordList.push(ele);
            });
            let childDatasp1 = c.get("v.childDatasp1");
            childDatasp1.forEach(function(ele) {
                ele.Parents__c = 'Spouse1';
                ele.Type__c = 'Child';
                if (!$A.util.isUndefinedOrNull(ele.First_Percentage_Of_Child__c)) {
                    if (typeof ele.First_Percentage_Of_Child__c === 'string') {
                        if (ele.First_Percentage_Of_Child__c.includes(',')) {
                            ele.First_Percentage_Of_Child__c = ele.First_Percentage_Of_Child__c.replace(',', '.');
                        }
                    }
                }


                if (!$A.util.isUndefinedOrNull(ele.First_Percentage__c)) {
                    if (typeof ele.First_Percentage__c === 'string') {
                        if (ele.First_Percentage__c.includes(',')) {
                            ele.First_Percentage__c = ele.First_Percentage__c.replace(',', '.');
                        }
                    }
                }
                personsRecordList.push(ele);
            });

            let childDatasp2 = c.get("v.childDatasp2");
            childDatasp2.forEach(function(ele) {
                ele.Parents__c = 'Spouse2';
                ele.Type__c = 'Child';
                if (!$A.util.isUndefinedOrNull(ele.First_Percentage_Of_Child__c)) {
                    if (typeof ele.First_Percentage_Of_Child__c === 'string') {
                        if (ele.First_Percentage_Of_Child__c.includes(',')) {
                            ele.First_Percentage_Of_Child__c = ele.First_Percentage_Of_Child__c.replace(',', '.');
                        }
                    }
                }


                if (!$A.util.isUndefinedOrNull(ele.First_Percentage__c)) {
                    if (typeof ele.First_Percentage__c === 'string') {
                        if (ele.First_Percentage__c.includes(',')) {
                            ele.First_Percentage__c = ele.First_Percentage__c.replace(',', '.');
                        }
                    }
                }
                personsRecordList.push(ele);
            });
            let childDataCommon = c.get("v.childDataCommon");
            childDataCommon.forEach(function(ele) {
                ele.Parents__c = 'Both';
                ele.Type__c = 'Child';
                if (!$A.util.isUndefinedOrNull(ele.First_Percentage_Of_Child__c)) {
                    if (typeof ele.First_Percentage_Of_Child__c === 'string') {
                        if (ele.First_Percentage_Of_Child__c.includes(',')) {
                            ele.First_Percentage_Of_Child__c = ele.First_Percentage_Of_Child__c.replace(',', '.');
                        }
                    }
                }


                if (!$A.util.isUndefinedOrNull(ele.First_Percentage__c)) {
                    if (typeof ele.First_Percentage__c === 'string') {
                        if (ele.First_Percentage__c.includes(',')) {
                            ele.First_Percentage__c = ele.First_Percentage__c.replace(',', '.');
                        }
                    }
                }
                personsRecordList.push(ele);
            });

            let hierPersonData = c.get("v.hierPersonData");
            hierPersonData.forEach(function(ele) {
                ele.Type__c = 'First_Heir (legetar)';
                if (!$A.util.isUndefinedOrNull(ele.Second_Percentage__c)) {
                    if (typeof ele.Second_Percentage__c === 'string') {
                        if (ele.Second_Percentage__c.includes(',')) {
                            ele.Second_Percentage__c = ele.Second_Percentage__c.replace(',', '.');
                        }
                    }
                }
                personsRecordList.push(ele);
            });

            let hier2PersonData = c.get("v.hier2PersonData");
            hier2PersonData.forEach(function(ele) {
                ele.Type__c = 'Second_Heir (legatar)';
                if (!$A.util.isUndefinedOrNull(ele.Second_Percentage__c)) {
                    if (typeof ele.Second_Percentage__c === 'string') {
                        if (ele.Second_Percentage__c.includes(',')) {
                            ele.Second_Percentage__c = ele.Second_Percentage__c.replace(',', '.');
                        }
                    }
                }
                personsRecordList.push(ele);
            });

            let spouse1Data = c.get("v.spouse1Data");
            spouse1Data.Type__c = 'Spouse 1';
            personsRecordList.push(spouse1Data);

            let spouse2Data = c.get("v.spouse2Data");
            spouse2Data.Type__c = 'Spouse 2';
            personsRecordList.push(spouse2Data);

            let AssetRecordsList = [];
            AssetRecordsList = c.get("v.assetMoney").concat(c.get("v.assetThing"));



            if (!$A.util.isUndefinedOrNull(JournalData.Lead__c)) {
                if (JournalData.Lead__r.IsConverted === false) {
                    h.getNewValuesForLead(c, e, h, JournalData);
                }
            }

            let action = c.get("c.insertJournaldata_Apex");
            action.setParams({
                'JournalData': JSON.stringify(JournalData),
                'personsData': JSON.stringify(personsRecordList),
                'assetData': JSON.stringify(AssetRecordsList),
                'personListToDelete': JSON.stringify(personDeleteList),
                'assetToDelete': JSON.stringify(AssetDeleteList),
                'guardianToDelete': JSON.stringify(guardianDeleteList),
                'GuardianData': JSON.stringify(guardiandata),
                'HeirToDelete': JSON.stringify(heirDeleteList),
                'ProcuratorsToDelete': JSON.stringify(childDataProcuratorDeleteList)
            });
            action.setCallback(this, function(response) {
                if (response.getState() === 'SUCCESS') {
                    let storedResponse = response.getReturnValue();
                    h.showSuccessToast(c, e, h);
                    h.checkTheObject(c, e, h);
                    //h.doInit_Helper(c, e, h, 'Journal__c');
                    $A.get('e.force:refreshView').fire();
                } else if (response.getState() === 'ERROR') {
                    let errorReport = response.getError();
                    //h.showErrorToast(c,e,h,errorReport);
                    h.sendErrorLogsToApex_Helper(c, e, h, c.get("v.recordId"), JSON.stringify(response.getError()), 'ERROR', 'DFJ_JournalForm', 'Inserting data in the Journal');
                } else {
                    console.error("Error");
                    h.sendErrorLogsToApex_Helper(c, e, h, c.get("v.recordId"), JSON.stringify(response.getError()), 'ERROR', 'DFJ_JournalForm', 'Inserting data in the Journal');
                    //h.showErrorToast(c,e,h);
                    console.info(response.getError());
                }
            });
            $A.enqueueAction(action);

        } catch (ex) {
            h.sendErrorLogsToApex_Helper(c, e, h, c.get("v.recordId"), ex.toString(), 'ERROR', 'DFJ_JournalForm', 'Inserting data in the Journal');
            console.error("Error" + ex);

        }
    },

    getNewValuesForLead: function(c, e, h, JournalData) {
        try {
            let leadList = c.get('v.updateLeadFields');
            let spouse1Data = c.get('v.spouse1Data');
            let changedValues = {};
            if (!$A.util.isUndefinedOrNull(spouse1Data)) {
                if (!$A.util.isUndefinedOrNull(spouse1Data.Address__c) && (spouse1Data.Address__c).trim() != '') {
                    if ($A.util.isUndefinedOrNull(JournalData.Lead__r.Street)) {
                        changedValues.Street = spouse1Data.Address__c;
                    } else if (JournalData.Lead__r.Street == spouse1Data.Address__c) {

                    } else {
                        changedValues.Street = spouse1Data.Address__c;
                    }
                }
                if (!$A.util.isUndefinedOrNull(spouse1Data.First_Name__c) && (spouse1Data.First_Name__c).trim() != '') {
                    if ($A.util.isUndefinedOrNull(JournalData.Lead__r.FirstName)) {
                        changedValues.FirstName = spouse1Data.First_Name__c;
                    } else if (JournalData.Lead__r.FirstName === spouse1Data.First_Name__c) {

                    } else {
                        changedValues.FirstName = spouse1Data.First_Name__c;
                    }
                }
                if (!$A.util.isUndefinedOrNull(spouse1Data.Last_Name__c) && (spouse1Data.Last_Name__c).trim() != '') {
                    if ($A.util.isUndefinedOrNull(JournalData.Lead__r.LastName)) {
                        changedValues.LastName = spouse1Data.Last_Name__c;
                    } else if (JournalData.Lead__r.LastName === spouse1Data.Last_Name__c) {

                    } else {
                        changedValues.LastName = spouse1Data.Last_Name__c;
                    }
                }
                if (!$A.util.isUndefinedOrNull(spouse1Data.City__c) && (spouse1Data.City__c).trim() != '') {
                    if ($A.util.isUndefinedOrNull(JournalData.Lead__r.City)) {
                        changedValues.City = spouse1Data.City__c;
                    } else if (JournalData.Lead__r.City === spouse1Data.City__c) {

                    } else {
                        changedValues.City = spouse1Data.City__c;
                    }
                }
                if (!$A.util.isUndefinedOrNull(spouse1Data.Zip_Code__c) && (spouse1Data.Zip_Code__c).trim() != '') {
                    if ($A.util.isUndefinedOrNull(JournalData.Lead__r.PostalCode)) {
                        changedValues.PostalCode = spouse1Data.Zip_Code__c;
                    } else if (JournalData.Lead__r.PostalCode === spouse1Data.Zip_Code__c) {

                    } else {
                        changedValues.PostalCode = spouse1Data.Zip_Code__c;
                    }
                }
                if (!$A.util.isUndefinedOrNull(spouse1Data.Email__c) && (spouse1Data.Email__c).trim() != '') {
                    if ($A.util.isUndefinedOrNull(JournalData.Lead__r.Email)) {
                        changedValues.Email = spouse1Data.Email__c;
                    } else if (JournalData.Lead__r.Email === spouse1Data.Email__c) {

                    } else {
                        changedValues.Email = spouse1Data.Email__c;
                    }
                }
            }
            if (Object.keys(changedValues).length === 0 && changedValues.constructor === Object) {
                c.set('v.isTheLeadAndPersonValuesDifferent', false);
            } else {
                c.set('v.isTheLeadAndPersonValuesDifferent', true);
                leadList.FirstName = changedValues.FirstName;
                leadList.LastName = changedValues.LastName;
                leadList.City = changedValues.City;
                leadList.PostalCode = changedValues.PostalCode;
                leadList.Email = changedValues.Email;
                leadList.id = JournalData.Lead__c;
                leadList.Street = changedValues.Street;
            }
            c.set('v.updateLeadFields', leadList);
        } catch (ex) {
            console.error('Error---' + ex);
        }
    },
    updateValues_helper: function(c, e, h) {
        try {
            let leadList = c.get('v.updateLeadFields');
            h.insertDataIntoApex(c, e, h, leadList);
            c.set('v.isTheLeadAndPersonValuesDifferent', false);
        } catch (ex) {
            console.log(`Error---${ex}`);
        }
    },

    editChildData_Helper: function(c, e, h) {
        try {
            c.set("v.isChildModalOpen", true);
            //c.set("v.hasValue", true);
            c.set("v.disableSaveChildrenButton", false);
            //c.set("v.spouse1childInstanceData",{});
            // let spouse1childInstanceData = c.get("v.spouse1childInstanceData");
            let tabIndex = e.getSource().get("v.tabindex");
            c.set("v.childInstanceEditIndex", tabIndex);
            let name = e.getSource().get("v.name");
            c.set("v.childInstanceEditName", name);
            let childSpouse1Data = c.get("v.childDatasp1");
            let childSpouse2Data = c.get("v.childDatasp2");
            let childDataCommon = c.get("v.childDataCommon");
            /* if(childSpouse1Data[tabIndex].Parents__c === 'Spouse1'){
                 console.info("Inside Spouse 1 child");
                 c.set("v.spouse1childInstanceData", childSpouse1Data[tabIndex]);
                 console.info("childSpouse1Data---"+JSON.stringify(childSpouse1Data[tabIndex]));
             }
             if(childSpouse2Data[tabIndex].Parents__c === 'Spouse2'){
             console.info("Inside Spouse 2 child");
                 c.set("v.spouse1childInstanceData", childSpouse2Data[tabIndex]);
             }
              if(childDataCommon[tabIndex].Parents__c === 'Both'){
              console.info("Inside Common child");
                 c.set("v.spouse1childInstanceData", childDataCommon[tabIndex]);
             }*/

            if (name === 'EditSpouse1') {
                c.set("v.spouse1childInstanceData", childSpouse1Data[tabIndex]);
            } else if (name === 'EditSpouse2') {
                c.set("v.spouse1childInstanceData", childSpouse2Data[tabIndex]);
            } else if (name === 'EditCommon') {
                c.set("v.spouse1childInstanceData", childDataCommon[tabIndex]);
            }
        } catch (ex) {
            console.log(`Error---${ex}`);
        }
    },

    editAssetMoneyData_helper: function(c, e, h) {
        try {
            c.set("v.IsAssetMoneyEditMode", true);
            let tabIndex = e.getSource().get("v.tabindex");
            c.set("v.assetMoneyInstanceEditIndex", tabIndex);
            let assetMoneyData = c.get("v.assetMoney");
            c.set("v.assetMoneyInstance", assetMoneyData[tabIndex]);
        } catch (ex) {
            console.log(`Error--${ex}`);
        }
    },

    editAssetThingData_helper: function(c, e, h) {
        try {
            c.set("v.IsAssetThingEditMode", true);
            let tabIndex = e.getSource().get("v.tabindex");
            c.set("v.assetThingInstanceEditIndex", tabIndex);
            let assetThingData = c.get("v.assetThing");
            c.set("v.assetThingInstance", assetThingData[tabIndex]);
        } catch (ex) {
            console.log(`Error---${ex}`);
        }
    },

    editGuardiandData_helper: function(c, e, h) {
        try {
            c.set("v.IsGuardianEditMode", true);
            let tabIndex = e.getSource().get("v.tabindex");
            c.set("v.guardianInstanceEditIndex", tabIndex);
            let guardiandata = c.get("v.guardianData");
            if (guardiandata[tabIndex].Guardian_type__c === 'N/A') {
                guardiandata[tabIndex].Guardian_type__c = 'Missing';
            }
            c.set("v.guardianInstance", guardiandata[tabIndex]);
        } catch (ex) {
            console.log(`Error---${ex}`);
        }
    },
    editUnwantedGuardiandData_helper: function(c, e, h) {
        try {
            c.set("v.IsUnwantedGuardianEditMode", true);
            let tabIndex = e.getSource().get("v.tabindex");
            c.set("v.guardianInstanceEditIndex", tabIndex);
            let unwantedGuardianData = c.get("v.unwantedGuardianData");
            c.set("v.unwantedGuardianInstance", unwantedGuardianData[tabIndex]);
        } catch (ex) {
            console.log(`Error---${ex}`);
        }
    },

    editProcuratorData_helper: function(c, e, h) {
        try {
            c.set("v.IsFutureProcurationModal", true);
            //c.set("v.hasValue",true);
            let tabIndex = e.getSource().get('v.tabindex');
            c.set("v.procuratorChildDataEditIndex", tabIndex);
            let childDataProcurator = c.get("v.childDataProcurator");
            c.set("v.childdataprocuratorInstance", childDataProcurator[tabIndex]);
        } catch (ex) {
            console.log(`Error--${ex}`);
        }
    },

    editHeir_helper: function(c, e, h) {
        try {
            c.set("v.IsHeirAddEdit", true);
            let tabIndex = e.getSource().get("v.tabindex");
            c.set("v.inheritanceEditIndex", tabIndex);
            let heirPersondata = c.get("v.hierPersonData");
            c.set("v.heirpersonInstance", heirPersondata[tabIndex]);
        } catch (ex) {
            console.log(`Error---${ex}`);
        }
    },
    editHeir2_helper: function(c, e, h) {
        try {
            c.set("v.IsHeir2AddEdit", true);
            let tabIndex = e.getSource().get("v.tabindex");
            c.set("v.inheritanceEditIndex", tabIndex);
            let heirPersondata = c.get("v.hier2PersonData");
            c.set("v.heir2personInstance", heirPersondata[tabIndex]);
        } catch (ex) {
            console.log(`Error---${ex}`);
        }
    },

    saveChildData_Helper: function(c, e, h) {
        try {
            let selectedIndex = c.get("v.childInstanceEditIndex");
            let spouse1Data = c.get("v.spouse1Data");
            let spouse2Data = c.get("v.spouse2Data");
            let child1Data = c.get("v.childDatasp1");
            let child2Data = c.get("v.childDatasp2");
            let commonChildData = c.get("v.childDataCommon");
            let childInstanceData = c.get("v.spouse1childInstanceData");
            let childOf = c.get("v.spouse1childInstanceData.Parents__c");
            let name = c.get('v.childInstanceEditName');

            //If the value in the table has to be editted.
            if (selectedIndex !== null && selectedIndex !== undefined) {
                if (childOf === 'Spouse1') {
                    if (name === 'EditSpouse1') {
                        child1Data.splice(selectedIndex, 1); //Remove the child from Spouse1 table.
                    } else if (name === 'EditSpouse2') {
                        child2Data.splice(selectedIndex, 1); //Remove the child from Spouse2 table.
                    } else if (name === 'EditCommon') {
                        commonChildData.splice(selectedIndex, 1); //Remove the child from Both table.
                    }
                    child1Data.push(childInstanceData);
                } else if (childOf === 'Spouse2') {
                    if (name === 'EditSpouse1') {
                        child1Data.splice(selectedIndex, 1); //Remove the child from Spouse1 table
                    } else if (name === 'EditSpouse2') {
                        child2Data.splice(selectedIndex, 1); //Remove the child from Spouse2 table.
                    } else if (name === 'EditCommon') {
                        commonChildData.splice(selectedIndex, 1); //Remove the child from Both table.
                    }
                    child2Data.push(childInstanceData);
                } else if (childOf === 'Both') {
                    if (name === 'EditSpouse1') {
                        child1Data.splice(selectedIndex, 1); //Remove the child from Spouse1 table
                    } else if (name === 'EditSpouse2') {
                        child2Data.splice(selectedIndex, 1); //Remove the child from Spouse2 table.
                    } else if (name === 'EditCommon') {
                        commonChildData.splice(selectedIndex, 1); //Remove the child from Both table.
                    }
                    commonChildData.push(childInstanceData);
                }

            } else { //If new child has to be created then simply push the value in the list.
                if (childOf === 'Spouse1') {
                    child1Data.push(childInstanceData);
                } else if (childOf === 'Spouse2') {
                    child2Data.push(childInstanceData);
                } else if (childOf === 'Both') {
                    commonChildData.push(childInstanceData);
                }
            }


            c.set("v.childDatasp1", child1Data);
            c.set("v.childDatasp2", child2Data);
            c.set("v.childDataCommon", commonChildData);
            c.set("v.childInstanceEditIndex", null);

            //Show error toast if the value of "childOf" is "Missing".
            if (childOf === 'Missing') {
                c.set("v.isChildModalOpen", true);
                c.set('v.disableSaveChildrenButton', false);
                h.showErrorToastForChildren(c, e, h);
            } else {
                c.set("v.isChildModalOpen", false);
                c.set('v.disableSaveChildrenButton', true);
            }

        } catch (ex) {
            console.log(`Error---${ex}`);
        }
    },


    showErrorToastForChildren: function(c, e, h) {
        let toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            title: 'Error Message',
            message: 'Select a Parent for the child.',
            messageTemplate: 'Select a Parent for the child.',
            duration: ' 5000',
            key: 'info_alt',
            type: 'error',
            mode: 'pester'
        });
        toastEvent.fire();
    },
    saveAssetMoneyData_helper: function(c, e, h) {
        let selectedIndex = c.get("v.assetMoneyInstanceEditIndex");
        let assetMoney = c.get("v.assetMoney");
        let assetMoneyInstance = c.get("v.assetMoneyInstance");
        if (selectedIndex !== null && selectedIndex !== undefined) {
            assetMoney[selectedIndex] = c.get("v.assetMoneyInstance");
        } else {
            assetMoneyInstance.Type__c = 'Money';
            assetMoney.push(assetMoneyInstance);
        }
        if (assetMoneyInstance.Id === null || assetMoneyInstance.Id === '' || assetMoneyInstance.Id === undefined) {

        } else {

        }
        c.set("v.assetMoney", assetMoney);
        c.set("v.assetMoneyInstance", null);
        c.set("v.IsAssetMoneyEditMode", false);
        c.set("v.assetMoneyInstanceEditIndex", null);

    },

    saveAssetThingData_helper: function(c, e, h) {
        let selectedIndex = c.get("v.assetThingInstanceEditIndex");
        let assetThing = c.get("v.assetThing");
        let assetThingInstance = c.get("v.assetThingInstance");

        if (assetThingInstance.Is_Personal_P__c === 'Yes') {
            assetThing.forEach(function(ele) {
                ele.Is_Personal_P__c = 'No';
            });
        }
        assetThingInstance.Is_Personal_P__c = 'Yes';
        /* if(assetThingInstance.Is_Personal_P__c === 'No'){
             assetThing.forEach(function(ele){
                 ele.Is_Personal_P__c = 'No';
             });
             assetThingInstance.Is_Personal_P__c = 'Yes';
         }*/
        if (selectedIndex !== null && selectedIndex !== undefined) {
            assetThing[selectedIndex] = c.get("v.assetThingInstance");
        } else {
            assetThingInstance.Type__c = 'Heirloom';
            assetThing.push(assetThingInstance);
        }

        if (assetThingInstance.Id === null || assetThingInstance.Id === '' || assetThingInstance.Id === undefined) {} else {}
        c.set("v.assetThing", assetThing);
        c.set("v.assetThingInstance", null);
        c.set("v.IsAssetThingEditMode", false);
        c.set("v.assetThingInstanceEditIndex", null);

    },

    saveGuardianData_helper: function(c, e, h) {
        try {
            let selectedIndex = c.get("v.guardianInstanceEditIndex");
            let guardianData = c.get("v.guardianData");
            let guardianInstance = c.get("v.guardianInstance");
            if (guardianInstance.Guardian_type__c === 'Missing') {
                guardianInstance.Guardian_type__c = 'N/A';
            }

            if (guardianInstance.Is_Primary__c === true) {
                guardianData.forEach(function(ele) {
                    ele.Is_Primary__c = false;
                });
                guardianInstance.Is_Primary__c = true;
            }

            if (selectedIndex !== undefined && selectedIndex !== null) {
                guardianData[selectedIndex] = c.get("v.guardianInstance");
            } else {
                guardianData.push(guardianInstance);
            }


            if (guardianInstance.Id === null || guardianInstance.Id === '' || guardianInstance.Id === undefined && (selectedIndex !== undefined && selectedIndex !== null)) {

            } else {

                //guardianInstance[selectedIndex] = c.get("v.guardianInstance");
            }

            c.set("v.guardianData", guardianData);
            c.set("v.guardianInstance", {});
            c.set("v.IsGuardianEditMode", false);
            c.set("v.guardianInstanceEditIndex", null);
        } catch (ex) {
            console.error('Error in adding guardian---' + ex);
        }
    },

    saveUnwantedGuardianData_helper: function(c, e, h) {
        let selectedIndex = c.get("v.guardianInstanceEditIndex");
        let unwantedGuardianData = c.get("v.unwantedGuardianData");
        let unwantedGuardianInstance = c.get("v.unwantedGuardianInstance");
        let unwantedGuardianList = [];


        if (selectedIndex !== undefined && selectedIndex !== null) {
            unwantedGuardianData[selectedIndex] = c.get("v.unwantedGuardianInstance");
        } else {
            unwantedGuardianData.push(unwantedGuardianInstance);
        }
        c.set("v.unwantedGuardianData", unwantedGuardianData);
        c.set("v.unwantedGuardianInstance", {});
        c.set("v.IsUnwantedGuardianEditMode", false);
        c.set("v.guardianInstanceEditIndex", null);
        //unwantedGuardianData.push(unwantedGuardianInstance);

    },

    saveChildDataProcurator_helper: function(c, e, h) {
        let selectedIndex = c.get("v.procuratorChildDataEditIndex");
        let childDataProcurator = c.get("v.childDataProcurator");
        let instanceData = c.get("v.childdataprocuratorInstance");
        let childDataProcuratorInstance = c.get("v.childdataprocuratorInstance");
        if (childDataProcuratorInstance.Parents__c === 'Missing') {
            h.showErrorToast(c, e, h, 'Vælg person som fuldmægtigt er ansvarlig for.');
        } else {
            if (childDataProcuratorInstance.Is_Primary_P__c === 'Yes') {
                childDataProcurator.forEach(function(ele) {
                    if (ele.Is_Primary_P__c === 'No') {
                        ele.Is_Primary_P__c = 'No';
                    } else {
                        ele.Is_Primary_P__c = 'Missing';
                    }
                });
                childDataProcuratorInstance.Is_Primary_P__c = 'Yes';
            }

            if (selectedIndex !== undefined && selectedIndex !== null && selectedIndex !== '') {
                childDataProcurator[selectedIndex] = childDataProcuratorInstance;
            } else {
                childDataProcurator.push(childDataProcuratorInstance);
            }
            childDataProcurator.sort(function(a, b) {
                return a.Priority__c - b.Priority__c;
            })
            c.set("v.childDataProcurator", childDataProcurator);
            c.set("v.childdataprocuratorInstance", {});
            c.set("v.IsFutureProcurationModal", false);
            c.set("v.procuratorChildDataEditIndex", null);
        }
    },

    saveHeirRecord_helper: function(c, e, h) {
        let selectedIndex = c.get("v.inheritanceEditIndex");
        let hierPersonData = c.get("v.hierPersonData");
        let heirpersonInstance = c.get("v.heirpersonInstance");
        heirpersonInstance.Type__c = 'First_Heir (legetar)';

        if (selectedIndex !== null && selectedIndex !== undefined) {
            hierPersonData[selectedIndex] = c.get("v.heirpersonInstance");
        } else {
            hierPersonData.push(heirpersonInstance);
        }


        c.set("v.hierPersonData", hierPersonData);
        c.set("v.IsHeirAddEdit", false);
        c.set("v.heirpersonInstance", {});
        c.set("v.IsHeirAddEdit", false);
        c.set("v.inheritanceEditIndex", null);

    },

    saveHeir2Record_helper: function(c, e, h) {
        let selectedIndex = c.get("v.inheritanceEditIndex");
        let heir2PersonData = c.get("v.hier2PersonData");
        let heir2personInstance = c.get("v.heir2personInstance");
        heir2personInstance.Type__c = 'Second_Heir (legatar)';
        if (selectedIndex !== null && selectedIndex !== undefined && selectedIndex !== '') {
            heir2PersonData[selectedIndex] = c.get("v.heir2personInstance");
        } else {
            heir2PersonData.push(heir2personInstance);
        }

        c.set("v.hier2PersonData", heir2PersonData);
        c.set("v.IsHeir2AddEdit", false);
        c.set("v.heir2personInstance", {});
        c.set("v.inheritanceEditIndex", null);
    },

    addNewGuardian_Helper: function(c, e, h) {
        c.set("v.IsGuardianEditMode", true);
        let guardianEmptyInstance = {};
        guardianEmptyInstance.Guardian_type__c = 'Missing';
        c.set("v.guardianInstance", guardianEmptyInstance);
    },
    addNewUnwantedGuardian_Helper: function(c, e, h) {
        c.set("v.IsUnwantedGuardianEditMode", true);
        c.set("v.unwantedGuardianInstance", {});
    },
    addNewChildToPersonList_Helper: function(c, e, h) {
        c.set('v.disableSaveChildrenButton', false);
        c.set("v.isChildModalOpen", true);
        //c.set("v.hasValue", false);
        let spouse1childInstance = {};
        spouse1childInstance.Custody__c = 'Missing';
        c.set("v.spouse1childInstanceData", spouse1childInstance);
    },

    addNewAssetMoneyToPersonList_helper: function(c, e, h) {
        c.set("v.IsAssetMoneyEditMode", true);

        //let assetMOneyInstance = c.get("v.assetMoneyInstance");
        //console.info('assetMOneyInstance---'+JSON.stringify(assetMOneyInstance));
        let assetMoneyInstance = {};
        assetMoneyInstance.Is_Personal_P__c = 'Yes';
        c.set("v.assetMoneyInstance", assetMoneyInstance);
    },

    addNewAssetThingToPersonList_helper: function(c, e, h) {
        c.set("v.IsAssetThingEditMode", true);
        c.set("v.assetThingInstance", {});
        let assetThingInstance = c.get("v.assetThingInstance");
        assetThingInstance.Is_Personal_P__c = 'Yes';
    },


    deleteAssetMoneyRecord_helper: function(c, e, h) {
        let AssetDeleteList = c.get("v.AssetDeleteList");
        let assetMoney = c.get("v.assetMoney");
        let tabIndex = e.getSource().get('v.tabindex');
        let AssetDeleteId = assetMoney[tabIndex].Id;
        AssetDeleteList.push(AssetDeleteId);
        c.set("v.AssetDeleteList", AssetDeleteList);
        assetMoney.splice(tabIndex, 1);
        // c.set("v.AssetDeleteList", assetMoney);
        c.set("v.assetMoney", assetMoney);


    },
    deleteAssetThingRecord_helper: function(c, e, h) {
        let AssetDeleteList = c.get("v.AssetDeleteList");
        let assetThing = c.get("v.assetThing");
        let tabIndex = e.getSource().get('v.tabindex');
        let AssetDeleteId = assetThing[tabIndex].Id;
        AssetDeleteList.push(AssetDeleteId);
        c.set("v.AssetDeleteList", AssetDeleteList);
        assetThing.splice(tabIndex, 1);
        c.set("v.assetThing", assetThing);
        //c.set("v.AssetDeleteList",assetThing);
    },

    deleteHeirRecord_helper: function(c, e, h) {
        let heirDeleteList = c.get("v.heirDeleteList");
        let heirPersonData = c.get("v.hierPersonData");
        let tabIndex = e.getSource().get('v.tabindex');
        if (heirPersonData != null && heirPersonData != undefined && heirPersonData != '') {
            let heirDeleteId = heirPersonData[tabIndex].Id;
            heirDeleteList.push(heirDeleteId);
            c.set("v.heirDeleteList", heirDeleteId);
        }
        heirPersonData.splice(tabIndex, 1);
        c.set("v.hierPersonData", heirPersonData);
    },
    deleteHeir2Record_helper: function(c, e, h) {
        let heir2DeleteList = c.get("v.heirDeleteList");
        let heir2PersonData = c.get("v.hier2PersonData");
        let tabIndex = e.getSource().get('v.tabindex');
        if (heir2PersonData != null && heir2PersonData != undefined && heir2PersonData != '') {
            let heir2DeleteId = heir2PersonData[tabIndex].Id;
            heir2DeleteList.push(heir2DeleteId);
            c.set("v.heirDeleteList", heir2DeleteId);
        }
        heir2PersonData.splice(tabIndex, 1);
        c.set("v.hier2PersonData", heir2PersonData);
    },

    deleteProcuratorChildData_helper: function(c, e, h) {
        let childDataProcuratorDeleteList = c.get("v.childDataProcuratorDeleteList");
        let childDataProcurator = c.get("v.childDataProcurator");
        let tabIndex = e.getSource().get('v.tabindex');
        if (childDataProcurator != null && childDataProcurator != undefined && childDataProcurator != '') {
            let childdataProcuratordeleteId = childDataProcurator[tabIndex].Id;
            childDataProcuratorDeleteList.push(childdataProcuratordeleteId);
            c.set("v.childDataProcuratorDeleteList", childDataProcuratorDeleteList);
        }
        childDataProcurator.splice(tabIndex, 1);
        c.set("v.childDataProcurator", childDataProcurator);
    },

    deleteGuardianRecord_helper: function(c, e, h) {
        let guardianDeleteList = c.get("v.GuardianDeleteList");
        let guardianData = c.get("v.guardianData");
        let tabIndex = e.getSource().get('v.tabindex');
        if (guardianData != null && guardianData != undefined && guardianData != '') {
            let guardianDataId = guardianData[tabIndex].Id;
            guardianDeleteList.push(guardianDataId);
            c.set("v.GuardianDeleteList", guardianDeleteList);
        }
        guardianData.splice(tabIndex, 1);
        c.set("v.guardianData", guardianData);
    },

    deleteUnwantedGuardianRecord_helper: function(c, e, h) {
        let guardianDeleteList = c.get("v.GuardianDeleteList");
        let unwantedGuardianData = c.get("v.unwantedGuardianData");
        let tabIndex = e.getSource().get('v.tabindex');
        if (unwantedGuardianData != null && unwantedGuardianData != undefined && unwantedGuardianData != '') {
            let unwantedGuardianDataId = unwantedGuardianData[tabIndex].Id;
            guardianDeleteList.push(unwantedGuardianDataId);
            c.set("v.GuardianDeleteList", guardianDeleteList);
        }
        unwantedGuardianData.splice(tabIndex, 1);
        c.set("v.unwantedGuardianData", unwantedGuardianData);
    },

    deleteChildRecord_helper: function(c, e, h) {
        let personListToDelete = c.get("v.PersonDeleteList");
        let child1data = c.get("v.childDatasp1");
        let tabIndex = e.getSource().get('v.tabindex');
        let personDeleteId = child1data[tabIndex].Id;
        personListToDelete.push(personDeleteId);
        c.set("v.PersonDeleteList", personListToDelete);
        child1data.splice(tabIndex, 1);
        c.set("v.childDatasp1", child1data);
    },
    deleteChildRecordOfSpouse2_helper: function(c, e, h) {
        let personListToDelete = c.get("v.PersonDeleteList");
        let child2data = c.get("v.childDatasp2");
        let tabIndex = e.getSource().get('v.tabindex');
        let personDeleteId = child2data[tabIndex].Id;
        personListToDelete.push(personDeleteId);
        c.set("v.PersonDeleteList", personListToDelete);
        child2data.splice(tabIndex, 1);
        c.set("v.childDatasp2", child2data);
    },
    deleteChildRecordOfCommonChild_helper: function(c, e, h) {
        let personListToDelete = c.get("v.PersonDeleteList");
        let commonChilddata = c.get("v.childDataCommon");
        let tabIndex = e.getSource().get('v.tabindex');
        let personDeleteId = commonChilddata[tabIndex].Id;
        personListToDelete.push(personDeleteId);
        c.set("v.PersonDeleteList", personListToDelete);
        commonChilddata.splice(tabIndex, 1);
        c.set("v.childDataCommon", commonChilddata);
    },

    showSuccessToast: function(c, e, h) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            title: 'Success',
            message: 'Saved successfully',
            messageTemplate: 'Product deleted successfully.',
            duration: ' 5000',
            key: 'info_alt',
            type: 'success',
            mode: 'pester'
        });
        toastEvent.fire();
    },

    showSections_helper: function(c, e, h) {

        try {
            let showHideSections = c.get("v.showHideSections");
            let JournalData = c.get("v.JournalData");
            if (JournalData.Civil_Status__c !== null && JournalData.Civil_Status__c !== undefined && JournalData.Civil_Status__c !== '') {
                if (JournalData.Civil_Status__c === 'Married') {
                    showHideSections.showSpouse2Section = true;
                    showHideSections.showMarriageSection = true;
                } else {
                    showHideSections.showSpouse2Section = false;
                    showHideSections.showMarriageSection = false
                }

            } else {
                showHideSections.showSpouse2Section = false;
                showHideSections.showMarriageSection = false;
            }

            if (JournalData.Civil_Status__c === 'Single' || JournalData.Civil_Status__c === 'Married' || JournalData.Civil_Status__c === 'Cohabiting') {
                showHideSections.showHasChildren = true;
            } else {
                showHideSections.showHasChildren = false;

            }
            if (JournalData.Has_Children__c !== null && JournalData.Has_Children__c !== undefined && JournalData.Has_Children__c !== '') {
                if (JournalData.Has_Children_P__c === 'Yes') {
                    if (JournalData.Civil_Status__c === 'Single') {
                        showHideSections.showTypeOfChildren = false;
                    } else {
                        showHideSections.showTypeOfChildren = true;
                    }
                    showHideSections.showChildrenSection = true;
                    //showHideSections.showAllChirenAreAbove18 = true;
                    //showHideSections.showGuradianSection = true;
                    //showHideSections.showEscrowConditionSection = true;
                } else if (JournalData.Has_Children_P__c === 'No') {
                    showHideSections.showTypeOfChildren = false;
                    //showHideSections.showAllChirenAreAbove18 = false;
                    showHideSections.showChildrenSection = false;
                    //showHideSections.showGuradianSection = false;
                    //showHideSections.showEscrowConditionSection = false;
                }
            }

            if (JournalData.All_children_over_18_P__c === 'Yes') {
                //showHideSections.showGuradianSection = false;
            }

            if (JournalData.Civil_Status__c === 'Single') {
                showHideSections.showAllowEditOrRecallSection = false;
                showHideSections.showLastSurvivingSection = false;
            } else {
                showHideSections.showAllowEditOrRecallSection = true;
                showHideSections.showLastSurvivingSection = true;
            }

            if (JournalData.Civil_Status__c === 'Cohabiting' || JournalData.Civil_Status__c === 'Married') {
                showHideSections.showSpouse2Section = true;
            } else {
                showHideSections.showSpouse2Section = false;
            }

            if (JournalData.Civil_Status__c === 'Cohabiting') {
                showHideSections.showCohabitingSection = true;
            } else {
                showHideSections.showCohabitingSection = false;
            }

            if (JournalData.Is_2_mutual_procurations_P__c == 'Yes') {
                showHideSections.showSpouse1AndSouse2Table = true;
            } else if (JournalData.Is_2_mutual_procurations_P__c == 'No') {
                showHideSections.showSpouse1AndSouse2Table = false;
            }

            if (JournalData.Use_year_instead_of_date_P__c == 'Yes') {
                showHideSections.showMarriageDatePicklist = false;
                showHideSections.showYearOfMarriage = true;
                showHideSections.showCohabitingYear = false;
                showHideSections.showYearOfCohabiting = true;
            } else if (JournalData.Use_year_instead_of_date_P__c == 'No') {
                showHideSections.showMarriageDatePicklist = true;
                showHideSections.showYearOfMarriage = false;
                showHideSections.showCohabitingYear = true;
                showHideSections.showYearOfCohabiting = false;
            }

            if (JournalData.Civil_Status__c === 'Single') {
                showHideSections.showInheritanceFromFirstDeceased = false;
                showHideSections.showInheritanceAsSingle = true;
            } else {
                showHideSections.showInheritanceFromFirstDeceased = true;
                showHideSections.showInheritanceAsSingle = false;

            }
            c.set("v.showHideSections", showHideSections);
            h.setSectionsAndFieldsVisibility(c, e, h);

        } catch (ex) {
            h.addErrorToLogs(c, e, h, c.get("v.recordId"), ex.toString(), 'ERROR', 'DFJ_JournalForm', 'In showing/hiding the sections');
            console.error("Error in showSections_Helper-----" + ex);
        }


    },

    setSectionsAndFieldsVisibility: function(c, e, h) {
        try {
            let configurationDataForSection = c.get("v.configurationData");
            let showHideFieldsUsingUniqueName = c.get("v.showHideFieldsUsingUniqueName");
            let sectionNameCounter = {};
            sectionNameCounter.sectionName = [];
            configurationDataForSection.forEach(function(ele) {
                switch (ele.uniqueName) {
                    /*All fields of PreQuestioning(Indledende Spørgsmål) section.*/
                    case "Indledende Spørgsmål":
                        showHideFieldsUsingUniqueName.PreQuestioning.isVisible = true;
                        break;

                    case "IndledendeSprgsml_Civilstatus":
                        showHideFieldsUsingUniqueName.CivilStatus.isVisible = true;
                        if (c.get('v.JournalData.Civil_Status__c') == 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.CivilStatus.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.CivilStatus.hasError = false;
                        }
                        break;

                    case "IndledendeSprgsml_Skalarvengivesvideresomsreje":
                        showHideFieldsUsingUniqueName.IndledendeSprgsml_Skalarvengivesvideresomsreje.isVisible = true;
                        if (c.get('v.JournalData.Seperate_Property__c') == 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.IndledendeSprgsml_Skalarvengivesvideresomsreje.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.IndledendeSprgsml_Skalarvengivesvideresomsreje.hasError = false;
                        }
                        break;
                    case "IndledendeSprgsml_Skalarvenbndlgges":
                        showHideFieldsUsingUniqueName.IndledendeSprgsml_Skalarvenbndlgges.isVisible = true;
                        if (c.get('v.JournalData.Add_Escrow__c') == 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.IndledendeSprgsml_Skalarvenbndlgges.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.IndledendeSprgsml_Skalarvenbndlgges.hasError = false;
                        }
                        break;
                    case "IndledendeSprgsml_Harbrn":
                        showHideFieldsUsingUniqueName.IndledendeSprgsml_Harbrn.isVisible = true;
                        if (c.get('v.JournalData.Has_Children_P__c') == 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.IndledendeSprgsml_Harbrn.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.IndledendeSprgsml_Harbrn.hasError = false;
                        }
                        break;
                    case "IndledendeSprgsml_Skaldertageshjeforfremtidigebrn":
                        showHideFieldsUsingUniqueName.IndledendeSprgsml_Skaldertageshjeforfremtidigebrn.isVisible = true;
                        if (c.get('v.JournalData.First_Include_Future_Children_P__c') == 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.IndledendeSprgsml_Skaldertageshjeforfremtidigebrn.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.IndledendeSprgsml_Skaldertageshjeforfremtidigebrn.hasError = false;
                        }
                        break;
                    case "IndledendeSprgsml_Skalderindsttesbrnetestamente":
                        showHideFieldsUsingUniqueName.IndledendeSprgsml_Skalderindsttesbrnetestamente.isVisible = true;
                        if (c.get('v.JournalData.Child_Wiils__c') == 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.IndledendeSprgsml_Skalderindsttesbrnetestamente.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.IndledendeSprgsml_Skalderindsttesbrnetestamente.hasError = false;
                        }
                        break;

                    case "IndledendeSprgsml_TypeBrn":
                        showHideFieldsUsingUniqueName.IndledendeSprgsml_TypeBrn.isVisible = true;
                        if (c.get('v.JournalData.Children_type__c') == 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.IndledendeSprgsml_TypeBrn.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.IndledendeSprgsml_TypeBrn.hasError = false;
                        }
                        break;

                    case "IndledendeSprgsml_Erallebrnmyndige":
                        showHideFieldsUsingUniqueName.IndledendeSprgsml_Erallebrnmyndige.isVisible = true;
                        if (c.get('v.JournalData.All_children_over_18_P__c') == 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.IndledendeSprgsml_Erallebrnmyndige.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.IndledendeSprgsml_Erallebrnmyndige.hasError = false;
                        }
                        break;

                    case "IndledendeSprgsml_HarDuItidligereoprettettestamente":
                        showHideFieldsUsingUniqueName.IndledendeSprgsml_HarDuItidligereoprettettestamente.isVisible = true;
                        if (c.get('v.JournalData.Former_Wills_P__c') == 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.IndledendeSprgsml_HarDuItidligereoprettettestamente.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.IndledendeSprgsml_HarDuItidligereoprettettestamente.hasError = false;
                        }
                        break;

                    case "IndledendeSprgsml_TestamenteType":
                        showHideFieldsUsingUniqueName.IndledendeSprgsml_TestamenteType.isVisible = true;
                        if (c.get('v.JournalData.Testament_Type__c') == 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.IndledendeSprgsml_TestamenteType.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.IndledendeSprgsml_TestamenteType.hasError = false;
                        }
                        break;

                    case "IndledendeSprgsml_Sidderduellerdinpartneriuskiftetboi":
                        showHideFieldsUsingUniqueName.IndledendeSprgsml_Sidderduellerdinpartneriuskiftetboi.isVisible = true;
                        if (c.get('v.JournalData.Undivided_estate_P__c') == 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.IndledendeSprgsml_Sidderduellerdinpartneriuskiftetboi.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.IndledendeSprgsml_Sidderduellerdinpartneriuskiftetboi.hasError = false;
                        }
                        break;

                    case "IndledendeSprgsml_Hvadervigtigtforkunden":
                        showHideFieldsUsingUniqueName.IndledendeSprgsml_Hvadervigtigtforkunden.isVisible = true;
                        break;
                        /*All fields of Person 1 (Spouse 1) section.*/
                    case "Person 1":
                        showHideFieldsUsingUniqueName.Person_1.isVisible = true;
                        break;

                    case "Person1_FirstName":
                        showHideFieldsUsingUniqueName.Person1_FirstName.isVisible = true;
                        if (c.get('v.spouse1Data.First_Name__c') == null || c.get('v.spouse1Data.First_Name__c') == undefined || c.get('v.spouse1Data.First_Name__c').trim() == '') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Person1_FirstName.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Person1_FirstName.hasError = false;
                        }
                        break;

                    case "Person1_LastName":
                        showHideFieldsUsingUniqueName.Person1_LastName.isVisible = true;
                        if (c.get('v.spouse1Data.Last_Name__c') == null || c.get('v.spouse1Data.Last_Name__c') == undefined || c.get('v.spouse1Data.Last_Name__c').trim() == '') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Person1_LastName.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Person1_LastName.hasError = false;
                        }
                        break;

                    case "Person1_CPR":
                        showHideFieldsUsingUniqueName.Person1_CPR.isVisible = true;
                        if (c.get('v.spouse1Data.CPR__c') == null || c.get('v.spouse1Data.CPR__c') == undefined || c.get('v.spouse1Data.CPR__c').trim() == '') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Person1_CPR.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Person1_CPR.hasError = false;
                        }
                        break;

                    case "Person1_Address":
                        showHideFieldsUsingUniqueName.Person1_Address.isVisible = true;
                        if (c.get('v.spouse1Data.Address__c') == null || c.get('v.spouse1Data.Address__c') == undefined || c.get('v.spouse1Data.Address__c').trim() == '') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Person1_Address.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Person1_Address.hasError = false;
                        }
                        break;

                    case "Person1_Zip":
                        showHideFieldsUsingUniqueName.Person1_Zip.isVisible = true;
                        if (c.get('v.spouse1Data.Zip_Code__c') == null || c.get('v.spouse1Data.Zip_Code__c') == undefined || c.get('v.spouse1Data.Zip_Code__c').trim() == '') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Person1_Zip.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Person1_Zip.hasError = false;
                        }
                        break;

                    case "Person1_City":
                        showHideFieldsUsingUniqueName.Person1_City.isVisible = true;
                        if (c.get('v.spouse1Data.City__c') == null || c.get('v.spouse1Data.City__c') == undefined || c.get('v.spouse1Data.City__c').trim() == '') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Person1_City.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Person1_City.hasError = false;
                        }
                        break;

                    case "Person1_Phone":
                        showHideFieldsUsingUniqueName.Person1_Phone.isVisible = true;
                        if (c.get('v.spouse1Data.Phone__c') == null || c.get('v.spouse1Data.Phone__c') == undefined || c.get('v.spouse1Data.Phone__c').trim() == '') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Person1_Phone.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Person1_Phone.hasError = false;
                        }
                        break;

                    case "Person1_Email":
                        showHideFieldsUsingUniqueName.Person1_Email.isVisible = true;
                        if (c.get('v.spouse1Data.Email__c') == null || c.get('v.spouse1Data.Email__c') == undefined || c.get('v.spouse1Data.Email__c').trim() == '') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Person1_Email.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Person1_Email.hasError = false;
                        }
                        break;

                    case "Person1_InternalNotes":
                        showHideFieldsUsingUniqueName.Person1_InternalNotes.isVisible = true;
                        break;
                        /*All fields of Person 2 (Spouse 2) section.*/
                    case "Person 2":
                        showHideFieldsUsingUniqueName.Person_2.isVisible = true;
                        break;
                    case "Person2_Fornavn":
                        showHideFieldsUsingUniqueName.Person2_Fornavn.isVisible = true;
                        if (c.get('v.spouse2Data.First_Name__c') == null || c.get('v.spouse2Data.First_Name__c') == undefined || c.get('v.spouse2Data.First_Name__c').trim() == '') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Person2_Fornavn.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Person2_Fornavn.hasError = false;
                        }
                        break;

                    case "Person2_Efternavn":
                        showHideFieldsUsingUniqueName.Person2_Efternavn.isVisible = true;
                        if (c.get('v.spouse2Data.Last_Name__c') == null || c.get('v.spouse2Data.Last_Name__c') == undefined || c.get('v.spouse2Data.Last_Name__c').trim() == '') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Person2_Efternavn.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Person2_Efternavn.hasError = false;
                        }
                        break;

                    case "Person2_CPR":
                        showHideFieldsUsingUniqueName.Person2_CPR.isVisible = true;
                        if (c.get('v.spouse2Data.CPR__c') == null || c.get('v.spouse2Data.CPR__c') == undefined || c.get('v.spouse2Data.CPR__c').trim() == '') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Person2_CPR.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Person2_CPR.hasError = false;
                        }
                        break;

                    case "Person2_Adresse":
                        showHideFieldsUsingUniqueName.Person2_Adresse.isVisible = true;
                        if (c.get('v.spouse2Data.Address__c') == null || c.get('v.spouse2Data.Address__c') == undefined || c.get('v.spouse2Data.Address__c').trim() == '') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Person2_Adresse.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Person2_Adresse.hasError = false;
                        }
                        break;

                    case "Person2_Postnummer":
                        showHideFieldsUsingUniqueName.Person2_Postnummer.isVisible = true;
                        if (c.get('v.spouse2Data.Zip_Code__c') == null || c.get('v.spouse2Data.Zip_Code__c') == undefined || c.get('v.spouse2Data.Zip_Code__c').trim() == '') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Person2_Postnummer.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Person2_Postnummer.hasError = false;
                        }
                        break;

                    case "Person2_By":
                        showHideFieldsUsingUniqueName.Person2_By.isVisible = true;
                        if (c.get('v.spouse2Data.City__c') == null || c.get('v.spouse2Data.City__c') == undefined || c.get('v.spouse2Data.City__c').trim() == '') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Person2_By.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Person2_By.hasError = false;
                        }
                        break;

                    case "Person2_Telefonnummer":
                        showHideFieldsUsingUniqueName.Person2_Telefonnummer.isVisible = true;
                        if (c.get('v.spouse2Data.Phone__c') == null || c.get('v.spouse2Data.Phone__c') == undefined || c.get('v.spouse2Data.Phone__c').trim() == '') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Person2_Telefonnummer.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Person2_Telefonnummer.hasError = false;
                        }
                        break;

                    case "Perosn2_Email":
                        showHideFieldsUsingUniqueName.Perosn2_Email.isVisible = true;
                        if (c.get('v.spouse2Data.Email__c') == null || c.get('v.spouse2Data.Email__c') == undefined || c.get('v.spouse2Data.Email__c').trim() == '') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Perosn2_Email.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Perosn2_Email.hasError = false;
                        }
                        break;

                    case "Person2_InternalNotes":
                        showHideFieldsUsingUniqueName.Person2_InternalNotes.isVisible = true;
                        break;

                    case "Person2_UseSameAddressAsPerson1":
                        showHideFieldsUsingUniqueName.Person2_UseSameAddressAsPerson1.isVisible = true;
                        if (c.get('v.JournalData.Use_same_address_as_spouse_1_P__c') == 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Person2_UseSameAddressAsPerson1.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Person2_UseSameAddressAsPerson1.hasError = false;
                        }
                        break;
                        /*All fields of Marriage (Ægteskab) section.*/
                    case "Ægteskab":
                        showHideFieldsUsingUniqueName.Marriage.isVisible = true;
                        break;
                    case "gteskab_marriageDate":
                        showHideFieldsUsingUniqueName.gteskab_marriageDate.isVisible = true;
                        break;

                    case "gteskab_YearOfMarriage":
                        showHideFieldsUsingUniqueName.gteskab_YearOfMarriage.isVisible = true;
                        break;

                    case "gteskab_UseYearInsteadOfDate":
                        showHideFieldsUsingUniqueName.gteskab_UseYearInsteadOfDate.isVisible = true;
                        if (c.get('v.JournalData.Use_year_instead_of_date_P__c') === 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.gteskab_UseYearInsteadOfDate.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.gteskab_UseYearInsteadOfDate.hasError = false;
                        }
                        break;

                    case "gteskab_marriageType":
                        showHideFieldsUsingUniqueName.gteskab_marriageType.isVisible = true;
                        if (c.get('v.JournalData.mariage_type__c') === 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.gteskab_marriageType.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.gteskab_marriageType.hasError = false;
                        }
                        break;

                    case "gteskab_Skaltestamentetbortfaldevedgteskabetsophr":
                        showHideFieldsUsingUniqueName.gteskab_Skaltestamentetbortfaldevedgteskabetsophr.isVisible = true;
                        if (c.get('v.JournalData.Testament_fall_on_divorce_P__c') === 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.gteskab_Skaltestamentetbortfaldevedgteskabetsophr.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.gteskab_Skaltestamentetbortfaldevedgteskabetsophr.hasError = false;
                        }
                        break;

                    case "gteskab_Skalbestemmelserderomhandlerbrneneandrearvingevedvare":
                        showHideFieldsUsingUniqueName.gteskab_Skalbestemmelserderomhandlerbrneneandrearvingevedvare.isVisible = true;
                        if (c.get('v.JournalData.persisting_inheritance__c') === 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.gteskab_Skalbestemmelserderomhandlerbrneneandrearvingevedvare.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.gteskab_Skalbestemmelserderomhandlerbrneneandrearvingevedvare.hasError = false;
                        }
                        break;

                    case "gteskab_Ejerifastejendomellerandetsammen":
                        showHideFieldsUsingUniqueName.gteskab_Ejerifastejendomellerandetsammen.isVisible = true;
                        if (c.get('v.JournalData.Common_Property_P__c') === 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.gteskab_Ejerifastejendomellerandetsammen.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.gteskab_Ejerifastejendomellerandetsammen.hasError = false;
                        }
                        break;

                    case "gteskab_Skaltestamentetfortsatgldehvislngstlevendeblivetgift":
                        showHideFieldsUsingUniqueName.gteskab_Skaltestamentetfortsatgldehvislngstlevendeblivetgift.isVisible = true;
                        if (c.get('v.JournalData.Testament_valid_on_surviving_remarriag_P__c') === 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.gteskab_Skaltestamentetfortsatgldehvislngstlevendeblivetgift.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.gteskab_Skaltestamentetfortsatgldehvislngstlevendeblivetgift.hasError = false;
                        }
                        break;

                    case "gteskab_Skallngstlevendemodtagearvensomsreje":
                        showHideFieldsUsingUniqueName.gteskab_Skallngstlevendemodtagearvensomsreje.isVisible = true;
                        if (c.get('v.JournalData.Surviving_inheritance_as_prenuptial_P__c') === 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.gteskab_Skallngstlevendemodtagearvensomsreje.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.gteskab_Skallngstlevendemodtagearvensomsreje.hasError = false;
                        }
                        break;

                    case "gteskab_Skaltilbagekaldelseellerndringkrvesamtykkefrabeggeparter":
                        showHideFieldsUsingUniqueName.gteskab_Skaltilbagekaldelseellerndringkrvesamtykkefrabeggeparter.isVisible = true;
                        if (c.get('v.JournalData.Edit_or_recall_P__c') === 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.gteskab_Skaltilbagekaldelseellerndringkrvesamtykkefrabeggeparter.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.gteskab_Skaltilbagekaldelseellerndringkrvesamtykkefrabeggeparter.hasError = false;
                        }
                        break;

                    case "gteskab_Lngstlevendestestationsret":
                        showHideFieldsUsingUniqueName.gteskab_Lngstlevendestestationsret.isVisible = true;
                        if (c.get('v.JournalData.last_surviving_conditions__c') === 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.gteskab_Lngstlevendestestationsret.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.gteskab_Lngstlevendestestationsret.hasError = false;
                        }
                        break;

                    case "gteskab_InternalNotes":
                        showHideFieldsUsingUniqueName.gteskab_InternalNotes.isVisible = true;
                        break;
                        /*case "gteskab_Sidderduellerdingteflleiuskiftetbo" :
                              showHideFieldsUsingUniqueName.gteskab_Sidderduellerdingteflleiuskiftetbo.isVisible = true;
                              break;*/
                        /*All fields of Cohabiting(Samlevende) section.*/
                    case "Samlevende":
                        showHideFieldsUsingUniqueName.Samlevende.isVisible = true;
                        break;
                    case "Samlevende_Datoforhvornrdeflyttedesammen":
                        showHideFieldsUsingUniqueName.Samlevende_Datoforhvornrdeflyttedesammen.isVisible = true;
                        break;
                    case "Samlevende_SkaltestamentetfortsatgldehvisIblivergift":
                        showHideFieldsUsingUniqueName.Samlevende_SkaltestamentetfortsatgldehvisIblivergift.isVisible = true;
                        if (c.get('v.JournalData.Testament_fall_on_divorce_P__c') === 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Samlevende_SkaltestamentetfortsatgldehvisIblivergift.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Samlevende_SkaltestamentetfortsatgldehvisIblivergift.hasError = false;
                        }
                        break;
                    case "Samlevende_Skaltestamentetbortfaldevedsamlivetsophr":
                        showHideFieldsUsingUniqueName.Samlevende_Skaltestamentetbortfaldevedsamlivetsophr.isVisible = true;
                        if (c.get('v.JournalData.Testament_fall_on_divorce_P__c') === 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Samlevende_Skaltestamentetbortfaldevedsamlivetsophr.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Samlevende_Skaltestamentetbortfaldevedsamlivetsophr.hasError = false;
                        }
                        break;
                    case "Samlevende_Skalbestemmelserderomhandlerbrneneandrearvingevedvare":
                        showHideFieldsUsingUniqueName.Samlevende_Skalbestemmelserderomhandlerbrneneandrearvingevedvare.isVisible = true;
                        if (c.get('v.JournalData.persisting_inheritance__c') === 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Samlevende_Skalbestemmelserderomhandlerbrneneandrearvingevedvare.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Samlevende_Skalbestemmelserderomhandlerbrneneandrearvingevedvare.hasError = false;
                        }
                        break;
                    case "Samlevende_Ejerifastejendomellerandetsammen":
                        showHideFieldsUsingUniqueName.Samlevende_Ejerifastejendomellerandetsammen.isVisible = true;
                        if (c.get('v.JournalData.Common_Property_P__c') === 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Samlevende_Ejerifastejendomellerandetsammen.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Samlevende_Ejerifastejendomellerandetsammen.hasError = false;
                        }
                        break;
                    case "Samlevende_Skaltestamentetfortsatgldehvislngstlevendeblivetgift":
                        showHideFieldsUsingUniqueName.Samlevende_Skaltestamentetfortsatgldehvislngstlevendeblivetgift.isVisible = true;
                        if (c.get('v.JournalData.Testament_valid_on_surviving_remarriag_P__c') === 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Samlevende_Skaltestamentetfortsatgldehvislngstlevendeblivetgift.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Samlevende_Skaltestamentetfortsatgldehvislngstlevendeblivetgift.hasError = false;
                        }
                        break;
                    case "Samlevende_Skallngstlevendemodtagearvensomsreje":
                        showHideFieldsUsingUniqueName.Samlevende_Skallngstlevendemodtagearvensomsreje.isVisible = true;
                        if (c.get('v.JournalData.Surviving_inheritance_as_prenuptial_P__c') === 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Samlevende_Skallngstlevendemodtagearvensomsreje.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Samlevende_Skallngstlevendemodtagearvensomsreje.hasError = false;
                        }
                        break;
                    case "Samlevende_Skaltilbagekaldelseellerndringkrvesamtykkefrabeggeparter":
                        showHideFieldsUsingUniqueName.Samlevende_Skaltilbagekaldelseellerndringkrvesamtykkefrabeggeparter.isVisible = true;
                        if (c.get('v.JournalData.Edit_or_recall_P__c') === 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Samlevende_Skaltilbagekaldelseellerndringkrvesamtykkefrabeggeparter.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Samlevende_Skaltilbagekaldelseellerndringkrvesamtykkefrabeggeparter.hasError = false;
                        }
                        break;
                    case "Samlevende_Lngstlevendestestationsret":
                        showHideFieldsUsingUniqueName.Samlevende_Lngstlevendestestationsret.isVisible = true;
                        if (c.get('v.JournalData.last_surviving_conditions__c') === 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Samlevende_Lngstlevendestestationsret.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Samlevende_Lngstlevendestestationsret.hasError = false;
                        }
                        break;
                    case "Samlevende_InternalNotes":
                        showHideFieldsUsingUniqueName.Samlevende_InternalNotes.isVisible = true;
                        break;
                    case "Samlevende_rstalforhvornrdeflyttedesammen":
                        showHideFieldsUsingUniqueName.Samlevende_rstalforhvornrdeflyttedesammen.isVisible = true;
                        break;
                    case "Samlevende_Benytrstalistedetfordato":
                        showHideFieldsUsingUniqueName.Samlevende_Benytrstalistedetfordato.isVisible = true;
                        if (c.get('v.JournalData.Use_year_instead_of_date_P__c') === 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Samlevende_Benytrstalistedetfordato.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Samlevende_Benytrstalistedetfordato.hasError = false;
                        }
                        break;
                        /*All fields of Children(Børn) section.*/
                    case "Børn":
                        showHideFieldsUsingUniqueName.Children.isVisible = true;
                        break;
                    case "Brn_InternalNotes":
                        showHideFieldsUsingUniqueName.Brn_InternalNotes.isVisible = true;
                        break;

                        /*All fields of Inheritance Distribution(Arvefordeling) section.*/
                    case "Arvefordeling_Vlgarvefordelingefterfrsteafdde":
                        showHideFieldsUsingUniqueName.Arvefordeling_Vlgarvefordelingefterfrsteafdde.isVisible = true;
                        if (c.get('v.JournalData.inheritance_from_first__c') === 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Arvefordeling_Vlgarvefordelingefterfrsteafdde.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Arvefordeling_Vlgarvefordelingefterfrsteafdde.hasError = false;
                        }
                        break;
                        /*case "Arvefordeling_Arv" :
                              showHideFieldsUsingUniqueName.Arvefordeling_Arv.isVisible = true;

                                  if(c.get('v.JournalData.inheritance_from_longest_lived__c') === 'Missing'){
                                      showHideFieldsUsingUniqueName.Arvefordeling_Arv.hasError = true;
                                  }else{
                                      showHideFieldsUsingUniqueName.Arvefordeling_Arv.hasError = false;
                                  }
                              break;*/

                    case "Arvefordeling_Arv":
                        showHideFieldsUsingUniqueName.Arvefordeling_Arv.isVisible = true;
                        let fieldValue1 = c.get('v.JournalData.inheritance_from_longest_lived__c');
                        if (fieldValue1 === 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Arvefordeling_Arv.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Arvefordeling_Arv.hasError = false;
                        }
                        break;
                    case "Arvefordeling_Vlgarvefordelingefterlngstlevende":
                        showHideFieldsUsingUniqueName.Arvefordeling_Vlgarvefordelingefterlngstlevende.isVisible = true;
                        let fieldValue = c.get('v.JournalData.inheritance_from_longest_lived__c');
                        if (fieldValue === 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Arvefordeling_Vlgarvefordelingefterlngstlevende.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Arvefordeling_Vlgarvefordelingefterlngstlevende.hasError = false;
                        }
                    case "Arvefordeling_TaghjdeforfremtidigebrnSecondIncludeFutureChildren":
                        showHideFieldsUsingUniqueName.Arvefordeling_TaghjdeforfremtidigebrnSecondIncludeFutureChildren.isVisible = true;
                        break;
                    case "Arvefordeling_nskesgravstedsvedligeholdelseAnbefalesuanset":
                        showHideFieldsUsingUniqueName.Arvefordeling_nskesgravstedsvedligeholdelseAnbefalesuanset.isVisible = true;
                        if (c.get('v.JournalData.Grave_Maintenance_P__c') === 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Arvefordeling_nskesgravstedsvedligeholdelseAnbefalesuanset.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Arvefordeling_nskesgravstedsvedligeholdelseAnbefalesuanset.hasError = false;
                        }
                        break;
                    case "Arvefordeling_Andetogelleruddybelse":
                        showHideFieldsUsingUniqueName.Arvefordeling_Andetogelleruddybelse.isVisible = true;
                        break;
                    case "Arvefordeling_InternalNotes":
                        showHideFieldsUsingUniqueName.Arvefordeling_InternalNotes.isVisible = true;
                        break;
                    case "Arvefordeling":
                        showHideFieldsUsingUniqueName.Arvefordeling.isVisible = true;
                        break;
                    case "Arvefordeling_Taghøjdeforfremtidigebørn":
                        if (c.get('v.JournalData.First_Include_Future_Children_P__c') === 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Arvefordeling_Taghjdeforfremtidigebrn.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Arvefordeling_Taghjdeforfremtidigebrn.hasError = false;
                        }
                        /*All fields of Asset(Legater) section.*/
                    case "Legater":
                        showHideFieldsUsingUniqueName.Legater.isVisible = true;
                        break;
                    case "Genstandslegat":
                        showHideFieldsUsingUniqueName.Genstandslegat.isVisible = true;
                        break;
                    case "Sumlegat":
                        showHideFieldsUsingUniqueName.Sumlegat.isVisible = true;
                        break;
                    case "Legater_InternalNotes":
                        showHideFieldsUsingUniqueName.Legater_InternalNotes.isVisible = true;
                        break;
                        /*All fields of Seperate property type and conditions(Særeje) section.*/
                    case "Særeje":
                        showHideFieldsUsingUniqueName.Seperate_property_type_and_conditions.isVisible = true;
                        break;
                    case "Særeje_Særejeform":
                        showHideFieldsUsingUniqueName.Sreje_Srejeform.isVisible = true;
                        if (c.get('v.JournalData.separate_property_type__c') === 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Sreje_Srejeform.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Sreje_Srejeform.hasError = false;
                        }
                        break;
                    case "Særeje_Yderligeresærejebetingelser":
                        showHideFieldsUsingUniqueName.Sreje_Yderligeresrejebetingelser.isVisible = true;
                        break;
                    case "Sreje_InternalNotes":
                        showHideFieldsUsingUniqueName.Sreje_InternalNotes.isVisible = true;
                        break;
                        /*All fields of Escrow Condition section(Båndlæggelse) section.*/
                    case "Bndlggelse_Bndlggelsesalder":
                        showHideFieldsUsingUniqueName.Bndlggelse_Bndlggelsesalder.isVisible = true;
                        if ($A.util.isUndefinedOrNull(c.get('v.JournalData.escrow_age__c'))) {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Bndlggelse_Bndlggelsesalder.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Bndlggelse_Bndlggelsesalder.hasError = false;
                        }
                        break;
                    case "Bndlggelse_Betingelser":
                        showHideFieldsUsingUniqueName.Bndlggelse_Betingelser.isVisible = true;
                        if ($A.util.isUndefinedOrNull(c.get('v.JournalData.Partial_Expense_Description__c')) || c.get('v.JournalData.Partial_Expense_Description__c').trim() === '') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Bndlggelse_Betingelser.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Bndlggelse_Betingelser.hasError = false;
                        }
                        break;
                    case "Bndlggelse_Skalerindsttessrligebetingelseribndlggelsestiden":
                        showHideFieldsUsingUniqueName.Bndlggelse_Skalerindsttessrligebetingelseribndlggelsestiden.isVisible = true;

                        if (c.get('v.JournalData.Special_Conditions__c') === 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Bndlggelse_Skalerindsttessrligebetingelseribndlggelsestiden.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Bndlggelse_Skalerindsttessrligebetingelseribndlggelsestiden.hasError = false;
                        }
                        break;
                    case "Bndlggelse_InternalNotes":
                        showHideFieldsUsingUniqueName.Bndlggelse_InternalNotes.isVisible = true;
                        break;
                    case "Båndlæggelse":
                        showHideFieldsUsingUniqueName.Escrow_Condition.isVisible = true;
                        break;

                        /*All fields Guradian(Børnetestamente) section.*/
                    case "Bonetestamente_Engangsbelbtilvrgen":
                        showHideFieldsUsingUniqueName.Bonetestamente_Engangsbelbtilvrgen.isVisible = true;
                        if (c.get('v.JournalData.Guardian_one_time_fee__c') == null || c.get('v.JournalData.Guardian_one_time_fee__c') == undefined) {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Bonetestamente_Engangsbelbtilvrgen.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Bonetestamente_Engangsbelbtilvrgen.hasError = false;
                        }
                        break;
                    case "Bornetestamente_MnedligtprBarn":
                        showHideFieldsUsingUniqueName.Bornetestamente_MnedligtprBarn.isVisible = true;
                        if (c.get('v.JournalData.Guardian_monthly_amount__c') == null || c.get('v.JournalData.Guardian_monthly_amount__c') == undefined) {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Bornetestamente_MnedligtprBarn.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Bornetestamente_MnedligtprBarn.hasError = false;
                        }
                        break;
                    case "Brnetestamente_InternalNotes":
                        showHideFieldsUsingUniqueName.Brnetestamente_InternalNotes.isVisible = true;
                        break;
                    case "Børnetestamente":
                        showHideFieldsUsingUniqueName.Guardian.isVisible = true;
                        break;
                    case "Brnetestamente_Skalderindsttesenunsketvrge":
                        showHideFieldsUsingUniqueName.Brnetestamente_Skalderindsttesenunsketvrge.isVisible = true;
                        if (c.get('v.JournalData.Unwanted_Guardian__c') === 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Brnetestamente_Skalderindsttesenunsketvrge.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Brnetestamente_Skalderindsttesenunsketvrge.hasError = false;
                        }
                        break;
                    case "Brnetestamente_Skalvrgenhaveadgangtiletbelb":
                        showHideFieldsUsingUniqueName.Brnetestamente_Skalvrgenhaveadgangtiletbelb.isVisible = true;
                        if (c.get('v.JournalData.Allow_Guardian_Amount__c') === 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Brnetestamente_Skalvrgenhaveadgangtiletbelb.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Brnetestamente_Skalvrgenhaveadgangtiletbelb.hasError = false;
                        }
                        break;

                        /*All fields of Future Procuration(Fremtidsfuldmagt) section.*/
                    case "Fremtidsfuldmagt":
                        showHideFieldsUsingUniqueName.Fremtidsfuldmagt.isVisible = true;
                        break;
                    case "Fremtidsfuldmagt_Erdet2gensidigefuldmagter":
                        showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Erdet2gensidigefuldmagter.isVisible = true;
                        if (c.get('v.JournalData.Is_2_mutual_procurations_P__c') === 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Erdet2gensidigefuldmagter.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Erdet2gensidigefuldmagter.hasError = false;
                        }
                        break;
                    case "Fremtidsfuldmagt_Skalderindsættesandrefuldmægteendgensidige":
                        showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Skalderindsttesandrefuldmgteendgensidige.isVisible = true;
                        if (c.get('v.JournalData.Use_subsidiary_procurators_P__c') === 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Skalderindsttesandrefuldmgteendgensidige.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Skalderindsttesandrefuldmgteendgensidige.hasError = false;
                        }
                        break;

                    case "Fremtidsfuldmagt_Skalsekundrefuldmgtigestiforeningiellerprioriteretrkeflge":
                        showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Skalsekundrefuldmgtigestiforeningiellerprioriteretrkeflge.isVisible = true;
                        if (c.get('v.JournalData.Procurator_order__c') === 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Skalsekundrefuldmgtigestiforeningiellerprioriteretrkeflge.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Skalsekundrefuldmgtigestiforeningiellerprioriteretrkeflge.hasError = false;
                        }
                        break;
                    case "Fremtidsfuldmagt_Personligeforhold":
                        showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Personligeforhold.isVisible = true;
                        if (c.get('v.JournalData.Personal_Conditions_P__c') === 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Personligeforhold.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Personligeforhold.hasError = false;
                        }
                        break;
                    case "Fremtidsfuldmagt_Økonomiskeforhold":
                        showHideFieldsUsingUniqueName.Fremtidsfuldmagt_konomiskeforhold.isVisible = true;
                        if (c.get('v.JournalData.Economical_Conditions_P__c') === 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_konomiskeforhold.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_konomiskeforhold.hasError = false;
                        }
                        break;
                    case "Fremtidsfuldmagt_Virksomhed":
                        showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Virksomhed.isVisible = true;
                        if (c.get('v.JournalData.Company_P__c') === 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Virksomhed.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Virksomhed.hasError = false;
                        }
                        break;
                    case "Fremtidsfuldmagt_Gavertilfuldmagtshaverselv":
                        showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Gavertilfuldmagtshaverselv.isVisible = true;
                        if (c.get('v.JournalData.Presents_for_charity_P__c') === 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Gavertilfuldmagtshaverselv.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Gavertilfuldmagtshaverselv.hasError = false;
                        }
                        break;
                    case "Fremtidsfuldmagt_Skalderkunnegiveslejlighedsgaver":
                        showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Skalderkunnegiveslejlighedsgaver.isVisible = true;
                        if (c.get('v.JournalData.Presents_occasionally_P__c') === 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Skalderkunnegiveslejlighedsgaver.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Skalderkunnegiveslejlighedsgaver.hasError = false;
                        }
                        break;
                    case "Fremtidsfuldmagt_Skalderkunnegivessdvanligegaver":
                        showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Skalderkunnegivessdvanligegaver.isVisible = true;
                        if (c.get('v.JournalData.Present_usually_P__c') === 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Skalderkunnegivessdvanligegaver.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Skalderkunnegivessdvanligegaver.hasError = false;
                        }
                        break;
                    case "Fremtidsfuldmagt_Afgiftsfriegaver":
                        showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Afgiftsfriegaver.isVisible = true;
                        if (c.get('v.JournalData.Tax_free_presents_P__c') === 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Afgiftsfriegaver.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Afgiftsfriegaver.hasError = false;
                        }
                        break;
                    case "Fremtidsfuldmagt_InternalNotes":
                        showHideFieldsUsingUniqueName.Fremtidsfuldmagt_InternalNotes.isVisible = true;
                        break;
                    case "Genstandslegat_InternalNotes":
                        showHideFieldsUsingUniqueName.Genstandslegat_InternalNotes.isVisible = true;
                        break;
                    case "Sumlegat_InternalNotes":
                        showHideFieldsUsingUniqueName.Sumlegat_InternalNotes.isVisible = true;
                        break;
                    case "Fremtidsfuldmagt_Skalfuldmgtigehaveadgangtiletrligthonorar":
                        showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Skalfuldmgtigehaveadgangtiletrligthonorar.isVisible = true;
                        if (c.get('v.Procurators_have_access_to_annual_fee_P__c') === 'Missing') {
                            let value = ele.uniqueName.split('_');
                            sectionNameCounter.sectionName.push(value[0]);
                            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Skalfuldmgtigehaveadgangtiletrligthonorar.hasError = true;
                        } else {
                            showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Skalfuldmgtigehaveadgangtiletrligthonorar.hasError = false;
                        }
                        break;
                    case "Fremtidsfuldmagt_Hvisjahvormeget":
                        showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Hvisjahvormeget.isVisible = true;
                        break;
                    case "Fremtidsfuldmagt_Gavertilvelgørenhed":
                        showHideFieldsUsingUniqueName.Fremtidsfuldmagt_Gavertilvelgrenhed.isVisible = true;
                        break;
                    default:
                        //console.info(" ");
                }
            });

            c.set("v.showHideFieldsUsingUniqueName", showHideFieldsUsingUniqueName);
            if (Object.keys(sectionNameCounter).length > 0 && sectionNameCounter.constructor === Object) {
                h.countNumberOfEmptyFields_helper(c, e, h, sectionNameCounter);
            }
        } catch (ex) {
            h.addErrorToLogs(c, e, h, c.get("v.recordId"), ex.toString(), 'ERROR', 'DFJ_JournalForm', 'setSectionsAndFieldsVisibility');
            console.log('Error---setSectionsAndFieldsVisibility---' + JSON.stringify(ex.message));
        }
    },

    countNumberOfEmptyFields_helper: function(c, e, h, counterObj) {
        try {
            let counter = 0;
            let counterForSection = {};
            counterForSection.countIndledendeSprgsml = 0;
            counterForSection.countPerson1 = 0;
            counterForSection.countPerson2 = 0;
            counterForSection.countgteskab = 0;
            counterForSection.countSamlevende = 0;
            counterForSection.countArvefordeling = 0;
            counterForSection.countLegater = 0;
            counterForSection.countSreje = 0;
            counterForSection.countBrn = 0;
            counterForSection.countBrnetestamente = 0;
            counterForSection.countBndlggelse = 0;
            counterForSection.countFremtidsfuldmagt = 0;

            counterObj.sectionName.forEach(function(ele) {
                if (ele === 'IndledendeSprgsml') {
                    counterForSection.countIndledendeSprgsml += 1;
                } else if (ele === 'Person1') {
                    counterForSection.countPerson1 += 1;
                } else if (ele === 'Person2') {
                    counterForSection.countPerson2 += 1;
                } else if (ele === 'gteskab') {
                    counterForSection.countgteskab += 1;
                } else if (ele === 'Samlevende') {
                    counterForSection.countSamlevende += 1;
                } else if (ele === 'Arvefordeling') {
                    counterForSection.countArvefordeling += 1;
                } else if (ele === 'Særeje') {
                    counterForSection.countSreje += 1;
                } else if (ele === 'Bndlggelse') {
                    counterForSection.countBndlggelse += 1;
                } else if (ele === 'Bornetestamente' || ele === 'Bonetestamente') {
                    counterForSection.countBrnetestamente += 1;
                } else if (ele === 'Fremtidsfuldmagt') {
                    counterForSection.countFremtidsfuldmagt += 1;
                }
            });
            counter = counterForSection.countPerson1 + counterForSection.countArvefordeling + counterForSection.countSreje + counterForSection.countIndledendeSprgsml + counterForSection.countPerson2 + counterForSection.countgteskab + counterForSection.countSamlevende + counterForSection.Bndlggelse + counterForSection.countBrnetestamente + counterForSection.countFremtidsfuldmagt;
            let sectionCounter = {};
            sectionCounter.countIndledendeSprgsml = counterForSection.countIndledendeSprgsml;
            sectionCounter.countPerson1 = counterForSection.countPerson1;
            sectionCounter.countPerson2 = counterForSection.countPerson2;
            sectionCounter.countgteskab = counterForSection.countgteskab;
            sectionCounter.countSamlevende = counterForSection.countSamlevende;
            sectionCounter.countArvefordeling = counterForSection.countArvefordeling;
            sectionCounter.countSreje = counterForSection.countSreje;
            sectionCounter.Bndlggelse = counterForSection.countBndlggelse;
            sectionCounter.countBrnetestamente = counterForSection.countBrnetestamente;
            sectionCounter.countFremtidsfuldmagt = counterForSection.countFremtidsfuldmagt;


            c.set("v.counterValue", sectionCounter);
            c.set("v.counter", counter);
        } catch (ex) {
            console.log('Error---' + ex.message);
        }
    },

    addEditHeir_helper: function(c, e, h) {
        c.set("v.IsHeirAddEdit", true);
        c.set("v.heirpersonInstance", {});
    },

    addEditHeir2_helper: function(c, e, h) {
        c.set("v.IsHeir2AddEdit", true);
        c.set("v.heir2personInstance", {});
    },

    showErrorToast: function(c, e, h, errorReport) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            title: 'Error Message',
            message: errorReport,
            messageTemplate: errorReport,
            duration: ' 5000',
            key: 'info_alt',
            type: 'error',
            mode: 'pester'
        });
        toastEvent.fire();
    },
    showErrorToastOnSwitch: function(c, e, h) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            title: 'Error Message',
            message: 'Please fill out the required field.',
            messageTemplate: 'Please fill out the required field.',
            duration: ' 5000',
            key: 'info_alt',
            type: 'error',
            mode: 'pester'
        });
        toastEvent.fire();
    },

    leadObject_helper: function(c, e, h, recordId, objectName) {
        try {
            let action = c.get("c.journalAssociatedWithLead");
            action.setParams({
                "recordId": recordId

            });
            action.setCallback(this, function(response) {
                if (response.getState() === 'SUCCESS') {
                    let storedResponse = response.getReturnValue();
                    if (storedResponse != null && storedResponse != undefined && storedResponse != '') {
                        c.set("v.journalId", storedResponse[0].Id);
                        //c.set("v.journalId",recordId);
                         //Changes DIN-383 
                        //Start
                        c.set('v.isCreateJournalHistoryOnLead', true);
                        //End
                        h.doInit_Helper(c, e, h, objectName);
                    }
                    $A.get('e.force:refreshView').fire();
                } else if (response.getState() === 'ERROR') {
                    //h.showErrorToast(c,e,h);
                    console.error("Error occurred");
                    h.sendErrorLogsToApex_Helper(c, e, h, c.get("v.recordId"), JSON.stringify(response.getError()), 'ERROR', 'DFJ_JournalForm', 'leadObject_helper');
                } else {
                    h.sendErrorLogsToApex_Helper(c, e, h, c.get("v.recordId"), JSON.stringify(response.getError()), 'ERROR', 'DFJ_JournalForm', 'leadObject_helper');
                    console.error("Error");
                    console.log(response.getError());
                }
            });
            $A.enqueueAction(action);
        } catch (ex) {
            h.sendErrorLogsToApex_Helper(c, e, h, c.get("v.recordId"), JSON.stringify(ex.message), 'ERROR', 'DFJ_JournalForm', 'leadObject_helper');
            console.error("Error" + ex.message);
        }
    },

    copySpouse1Address_helper: function(c, e, h) {
        h.showSections_helper(c, e, h);
        let JournalData = c.get("v.JournalData");
        let spouse1Data = c.get("v.spouse1Data");
        let spouse2Data = c.get("v.spouse2Data");
        if (JournalData.Use_same_address_as_spouse_1_P__c == 'Yes') {
            if (spouse1Data != null && spouse1Data != undefined && spouse1Data != '') {
                spouse2Data.Address__c = spouse1Data.Address__c;
                spouse2Data.Zip_Code__c = spouse1Data.Zip_Code__c;
                spouse2Data.City__c = spouse1Data.City__c;
            }
        } else if (JournalData.Use_same_address_as_spouse_1_P__c == 'No') {
            spouse2Data.Address__c = '';
            spouse2Data.Zip_Code__c = '';
            spouse2Data.City__c = '';
        }
        c.set("v.spouse2Data", spouse2Data);
    },

    showJournalForm_helper: function(c, e, h) {
        c.set("v.isOpenJournalFormClicked", true);
        h.checkTheObject(c, e, h);
        c.set("v.ShowComponentButton", true);
        let quickAction = c.get("v.closeModal");
        if (quickAction === false) {
            c.set("v.closeModal", true);
        }
        //h.doInit_Helper(c,e,h);
    },



    showSpinner_Helper: function(c, e) {
        c.set("v.isSpinnerOpen", true);
        window.setTimeout(
            $A.getCallback(function() {
                c.set("v.isSpinnerOpen", false);
            }), 4500
        );
    },
    hideSpinner_Helper: function(c, e) {
        c.set("v.isSpinnerOpen", false);
    },

    updateFieldsOutsideForm_helper: function(c, e, h) {
        try {
            c.set('v.isSetStatesValueOnLead', true);
            let journalState = c.get("v.JournalData.Journal_States__c");
            let deadline = c.get("v.JournalData.journal_Deadline__c");
            //Changes Starts DFJ-106
          //  let type = c.get("v.JournalData.Type__c");
            //End
            let journalId = c.get("v.journalId");
            let responsibleLawyer = c.get('v.JournalData.Responsible_Lawyer__c');
            //DFJ-160 Changes
            let retskreds = c.get('v.JournalData.Retskreds__c');
            //End
            let action = c.get("c.updateJournalFields_Apex");
            //Chnages DIN-383
            //Start : Add validation on Update Button if Journal is not exist on Journal
            if(journalId){
            action.setParams({
                'journalState': journalState,
                'deadline': deadline,
                'journalId': journalId,
                'responsibleLawyer': responsibleLawyer,
                'retskreds': retskreds,
                //Changes Starts DFJ-106 Remove the type form the Component.
               // 'type': type
                //End
            });
            action.setCallback(this, function(response) {

                let state = response.getState();
                if (state === 'SUCCESS') {
                    //changes DIN-383
                    //Start
                    h.createRecordOfJournalHistoryonJournal_helper(c,e,h);
                    //End
                    let storedResponse = response.getReturnValue();
                    if (storedResponse != null && storedResponse != undefined && storedResponse != '') {
                        h.showSuccessToast(c, e, h);
                        $A.get('e.force:refreshView').fire();
                      
                    } else {
                        //h.showErrorToast(c,e,h);
                        h.sendErrorLogsToApex_Helper(c, e, h, c.get("v.recordId"), JSON.stringify(response.getError()), 'ERROR', 'DFJ_JournalForm', 'updateFieldsOutsideForm_helper');
                    }
                }
            });
            
            $A.enqueueAction(action);
        }else{
            let error = 'Journal not found.';
            h.showErrorToast(c,e,h,error);
        }
        } catch (ex) {
            h.sendErrorLogsToApex_Helper(c, e, h, c.get("v.recordId"), JSON.stringify(ex), 'ERROR', 'DFJ_JournalForm', 'updateFieldsOutsideForm_helper');
            console.error('Error--' + ex);
        }
    },

    checkTheObject: function(c, e, h) {
        let objectName = c.get("v.sObjectName");
        if (objectName === 'Journal__c') {
            let recordId = c.get("v.recordId");
            c.set("v.journalId", recordId);
             //Changes DIN-383 
            //Start
            c.set('v.isCreateJournalHistoryOnLead', true);
            c.set('v.isSetLastEditValueOnLead', true);

            //End
            h.doInit_Helper(c, e, h, objectName);
            //h.createRecordOfJournalHistory_helper(c,e,h);
        } else if (objectName === 'Lead') {
            let recordId = c.get("v.recordId");
            c.set("v.leadId", c.get("v.recordId"));
            h.leadObject_helper(c, e, h, recordId, objectName);
        }
    },

    onLoadOfPage: function(c, e, h) {
        try {
            let objectName = c.get("v.sObjectName");
            if (objectName === 'Journal__c') {
                let recordId = c.get("v.recordId");
                c.set("v.journalId", recordId);
                h.doInit_Helper(c, e, h, objectName);
              
            } else if (objectName === 'Lead') {
                c.set("v.leadId", c.get("v.recordId"));
                let recordId = c.get("v.recordId");
            }
        } catch (ex) {
            console.log(`Error---${ex}`);
        }
    },

    showJournaldataOnLead_helper: function(c, e, h) {
        
        try {
            let objectName = c.get("v.sObjectName");
            let leadId = c.get("v.recordId");
            if (objectName === 'Lead') {
                let action = c.get("c.getJournalStatusAndDeadline_Apex");
                action.setParams({
                    'leadId': leadId
                });
                action.setCallback(this, function(response) {
                    let state = response.getState();
                    if (state === 'SUCCESS') {
                        //console.log('Success got the res journal');
                        let storedResponse = response.getReturnValue();
                        //console.log('Success got the res journal', JSON.stringify(storedResponse[0]));

                        // changes for DIN-197 : Process document template feature.
                        // Start
                        if (!storedResponse || storedResponse.length === 0 || !storedResponse[0].External_record_uuid__c || storedResponse[0].External_record_uuid__c.trim() === '') {
                            c.set('v.disableProcessDocfabButton', true);
                        } else {
                            c.set('v.disableProcessDocfabButton', false);
                             //Changes DIN-383
                            //Start : Used for setting the LastModified Old value on Open Jpournal Form button
                            //If Journal already exist and user click on Open journal form.
                            c.set("v.isSetLastEditValueOnLead", true);
                            //End
                        }
                        // End
                        if (storedResponse && storedResponse.length) {
                            let journalData = c.get('v.JournalData');
                            journalData.External_record_uuid__c = storedResponse[0].External_record_uuid__c;
                            journalData.Type__c = storedResponse[0].Type__c;
                            c.set('v.JournalData', journalData);
                        }
                    }
                });
                $A.enqueueAction(action);
            }
        } catch (ex) {
            h.sendErrorLogsToApex_Helper(c, e, h, c.get("v.recordId"), JSON.stringify(ex), 'ERROR', 'DFJ_JournalForm', 'showJournaldataOnLead_helper');
            console.error('Error--' + ex);
        }
    },

    createEventOnJournal_Helper: function(c, e, h) {
        try {
            let EventObj = c.get("v.EventObj");
            EventObj.WhatId = c.get("v.journalId");
            // Changes for DIN-180 : Add checkbox to schedule meeting with attorney
            // Start
            let journalObject = c.get("v.JournalData");
            // End
            //EventObj.Subject = 'Call with ';
            EventObj.EndDateTime = new Date(c.get("v.EventObj.StartDateTime")).setMinutes(new Date(c.get("v.EventObj.StartDateTime")).getMinutes() + parseInt(c.find("durationValue").get("v.value")));

            let action = c.get("c.insertEventData_Apex");
            action.setParams({
                'EventData': JSON.stringify(EventObj),
                'journalData': JSON.stringify(journalObject)
            });
            action.setCallback(this, function(response) {
                if (response.getState() === 'SUCCESS') {
                    let storedResponse = response.getReturnValue();
                    h.showSuccessToast(c, e, h);
                    c.set('v.JournalData.journal_Deadline__c', storedResponse);
                    $A.get('e.force:refreshView').fire();
                    c.set("v.isModalOpen", false);
                } else if (response.getState() === 'ERROR') {
                    let errorReport = response.getError();
                    h.sendErrorLogsToApex_Helper(c, e, h, c.get("v.recordId"), JSON.stringify(response.getError()), 'ERROR', 'DFJ_JournalForm', 'createEventOnJournal_Helper');
                    // h.showErrorToast(c,e,h,errorReport);
                } else {
                    h.sendErrorLogsToApex_Helper(c, e, h, c.get("v.recordId"), JSON.stringify(response.getError()), 'ERROR', 'DFJ_JournalForm', 'createEventOnJournal_Helper');
                    console.error("Error");
                    console.log(response.getError());
                }
            });
            $A.enqueueAction(action);
        } catch (ex) {
            h.sendErrorLogsToApex_Helper(c, e, h, c.get("v.recordId"), JSON.stringify(ex), 'ERROR', 'DFJ_JournalForm', 'createEventOnJournal_Helper');
            console.error('Error-->' + ex);
        }

    },

    validateEventData_Helper: function(c, e, h) {
        let allValid = c.find('appointMent').reduce(function(validSoFar, inputCmp) {
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        if (allValid) {
            h.createEventOnJournal_Helper(c, e, h);
        } else {

        }
    },

    copyChildrenInFutureProc_helper: function(c, e, h) {
        try {
            let spouse1Child = c.get('v.childDatasp1');
            let spouse2Child = c.get('v.childDatasp2');
            let commonChild = c.get('v.childDataCommon');
            let selectedValue = c.get('v.selectedChild');
            let guardianData = c.get('v.guardianData');
            let allChild = spouse1Child.concat(spouse2Child, commonChild, guardianData);
            let fullNames = '';
            allChild.forEach(function(ele) {
                if (ele.First_Name__c != null && ele.Last_Name__c != null && ele.Last_Name__c.trim() != '' && ele.First_Name__c.trim() != '') {

                    if (ele.Type__c === 'Child') {
                        fullNames = ele.First_Name__c + ' ' + ele.Last_Name__c + ' ' + '(Barn)';
                        if (fullNames === selectedValue) {
                            c.set('v.childdataprocuratorInstance.First_Name__c', ele.First_Name__c);
                            c.set('v.childdataprocuratorInstance.Last_Name__c', ele.Last_Name__c);
                            c.set('v.childdataprocuratorInstance.CPR__c', ele.CPR__c);
                            c.set('v.childdataprocuratorInstance.Parents__c', ele.Parents__c);
                        }
                    } else if (ele.Type__c === 'Guardian 1') {
                        fullNames = ele.First_Name__c + ' ' + ele.Last_Name__c + ' ' + '(Værge)';
                        //TODO : What will be the value of "Fuldmægtig for:" if the type is Guardian.
                        if (fullNames === selectedValue) {
                            c.set('v.childdataprocuratorInstance.First_Name__c', ele.First_Name__c);
                            c.set('v.childdataprocuratorInstance.Last_Name__c', ele.Last_Name__c);
                            c.set('v.childdataprocuratorInstance.CPR__c', ele.CPR__c);
                        }
                    }
                }

            });

        } catch (ex) {
            console.error('Error-->' + ex);
        }
    },

    getAllChilds_helper: function(c, e, h) {
        try {
            let spouse1Child = c.get('v.childDatasp1');
            let spouse2Child = c.get('v.childDatasp2');
            let commonChild = c.get('v.childDataCommon');
            let guardianData = c.get('v.guardianData');
            let allChild = spouse1Child.concat(spouse2Child, commonChild, guardianData);
            let allChildNames = [];
            let fullNames = '';
            spouse1Child.forEach(function(ele) {
                if ($A.util.isUndefinedOrNull(ele.Type__c)) {
                    ele.Type__c = 'Child';
                }
            });

            spouse2Child.forEach(function(ele) {
                ele.Type__c = 'Child';
            });

            commonChild.forEach(function(ele) {
                ele.Type__c = 'Child';
            });

            guardianData.forEach(function(ele) {
                if ($A.util.isUndefinedOrNull(ele.Type__c)) {
                    ele.Type__c = 'Guardian 1';
                }
            });

            allChild.forEach(function(ele) {
                if (!$A.util.isUndefinedOrNull(ele.First_Name__c) && !$A.util.isUndefinedOrNull(ele.Last_Name__c) && ele.Last_Name__c.trim() != '' && ele.First_Name__c.trim() != '') {
                    if (ele.Type__c === 'Child') {
                        fullNames = ele.First_Name__c + ' ' + ele.Last_Name__c + ' ' + '(Barn)';
                    } else if (ele.Type__c === 'Guardian 1') {
                        fullNames = ele.First_Name__c + ' ' + ele.Last_Name__c + ' ' + '(Værge)';
                    }
                    allChildNames.push(fullNames);
                }
            });
            c.set('v.allChildren', allChildNames);
        } catch (ex) {
            console.error('Error--->' + ex);
        }
    },



    // Send error to Salesforce log object to catch if anything happens in the lightning components.
    sendErrorLogsToApex_Helper: function(c, e, h, recordId, exceptionMessage, severity, source, event) {
        try {
            let errorObjectInstance = c.get("v.errorLog");
            errorObjectInstance.Affected_record__c = recordId;
            errorObjectInstance.Message__c = exceptionMessage;
            errorObjectInstance.Severity__c = severity;
            errorObjectInstance.Source__c = source;
            errorObjectInstance.Event__c = event;


            let action = c.get("c.addErrorLogsInSalesforce_Apex");
            action.setParams({
                "logData": JSON.stringify(errorObjectInstance)
            });
            action.setCallback(this, function(r) {
                if (r.getState() === 'SUCCESS') {
                    let storedResponse = r.getReturnValue();
                    if (storedResponse != null) {
                        h.showErrorToast(c, e, h, storedResponse.substring(storedResponse.indexOf("message") + 10, 106));
                    }

                }
            });
            $A.enqueueAction(action);
        } catch (ex) {
            console.error('Error--' + ex);
        }
    },

    insertDataIntoApex: function(c, e, h, leadList) {
        try {
            let action = c.get("c.updateLeadValues_Apex");
            action.setParams({
                "changedValues": JSON.stringify(leadList)
            });
            action.setCallback(this, function(r) {
                if (r.getState() === 'SUCCESS') {
                    let storedResponse = r.getReturnValue();
                    if (storedResponse != null) {}
                }
            });
            $A.enqueueAction(action);
        } catch (ex) {
            h.sendErrorLogsToApex_Helper(c, e, h, c.get("v.recordId"), ex.toString(), 'ERROR', 'DFJ_JournalForm', 'Inserting data in the Journal');
            console.log("Error" + ex);

        }
    },


    /*Validate fields and sections*/
    validateField: function(c, e, h) {
        try {
            h.setSectionsAndFieldsVisibility(c, e, h);
        } catch (ex) {
            h.addErrorToLogs(c, e, h, c.get("v.recordId"), ex.toString(), 'ERROR', 'DFJ_JournalForm', 'Validating the fields');
            console.info("Error in validating fields----" + ex.message);
        }
    },


    addErrorToLogs: function(c, e, h, recordId, exceptionMessage, severity, source, event) {
        try {
            let errorObjectInstance = c.get("v.errorLog");
            errorObjectInstance.Affected_record__c = recordId;
            errorObjectInstance.Message__c = exceptionMessage;
            errorObjectInstance.Severity__c = severity;
            errorObjectInstance.Source__c = source;
            errorObjectInstance.Event__c = event;

            let action = c.get("c.addSectionErrors_Apex");
            action.setParams({
                "logData": JSON.stringify(errorObjectInstance)
            });
            action.setCallback(this, function(r) {
                if (r.getState() === 'SUCCESS') {
                    let storedResponse = r.getReturnValue();
                    if (storedResponse != null) {
                        h.showErrorToast(c, e, h, storedResponse.substring(storedResponse.indexOf("message") + 10, 106));
                    }

                }
            });
            $A.enqueueAction(action);
        } catch (ex) {
            console.error('Error--' + ex);
        }
    },

    // Changes for ticket DIN-197 : "Process document template feature"
    // Start
    processDocfabDocument_helper: function(c, e, h) {
            try {
                let journalData = c.get('v.JournalData');
                if (journalData && journalData.External_record_uuid__c && journalData.External_record_uuid__c.trim() !== '') {
                    c.find("navigationService").navigate({
                        type: "standard__webPage",
                        attributes: {
                            url: 'https://admin.docfabricator.com/public/record_templates/' + journalData.External_record_uuid__c
                        }
                    });
                }

            } catch (ex) {
                console.error('Error--' + ex);
            }
        },
        // End
       
        //Chnages DIN-383 - Improve Journal History
        //Start
        createRecordOfJournalHistoryonJournal_helper: function(c, e, h) {
            try {
                let journalHistoryObject = {};
                let today = new Date();
                 
                let journalNewData = c.get("v.JournalData");
                let journalId = c.get("v.journalId");
                //Journal New Value
                journalHistoryObject.Journal__c =  journalId;
                journalHistoryObject.journal_Deadline_New__c = journalNewData.journal_Deadline__c;
                journalHistoryObject.Journal_States_New__c = journalNewData.Journal_States__c;
                journalHistoryObject.Responsible_lawyer_New__c = journalNewData.Responsible_Lawyer__c;
                //DFJ-160 Changes Starts
                journalHistoryObject.Retskreds__c = journalNewData.Retskreds__c;
                //End
                journalHistoryObject.Last_time_journal_was_edited_New__c = today;
               
             
                //Journal Old Value 
                let oldJournalData= c.get("v.JournalRecordData");    
                journalHistoryObject.Journal_States_Old__c = oldJournalData.Journal_States__c;
                journalHistoryObject.Last_time_journal_was_edited_Old__c = c.get("v.JournalRecordData.LastModifiedDate");
                journalHistoryObject.Responsible_lawyer_Old__c = oldJournalData.Responsible_Lawyer__c;
                //DFJ-160 Changes Starts
                journalHistoryObject.Retskreds__c = oldJournalData.Retskreds__c;
                //End
                journalHistoryObject.journal_Deadline_Old__c = oldJournalData.journal_Deadline__c;
              
                if( journalHistoryObject.Journal__c){
                    //DFJ-160 Changes added Retskreds__c in the if condition
                    if(journalNewData.Journal_States__c != oldJournalData.Journal_States__c  || journalNewData.journal_Deadline__c != oldJournalData.journal_Deadline__c || journalNewData.Responsible_Lawyer__c != oldJournalData.Responsible_Lawyer__c  || journalNewData.Retskreds__c != oldJournalData.Retskreds__c){
                    
                    let action = c.get("c.updateJournalHistroyRecord");
                    action.setParams({
                        'journalHistoryData': JSON.stringify(journalHistoryObject)
                    });
                    action.setCallback(this, function(response) {
        
                        let state = response.getState();
                        if (state === 'SUCCESS') {
                            let storedResponse = response.getReturnValue();

                            if (storedResponse != null && storedResponse != undefined && storedResponse != '') {
                                c.set("v.JournalData", Object.assign({}, storedResponse[0]));
                                c.set("v.JournalRecordData", Object.assign({}, storedResponse[0]));
                                // console.log('journalData createRecordOfJournalHistoryonJournal_helper >>> ' ,JSON.stringify( c.get("v.JournalRecordData")));
                                // console.log('storedResponse createRecordOfJournalHistoryonJournal_helper >>> ' ,JSON.stringify( storedResponse));
                            } else {
                                //h.showErrorToast(c,e,h);
                                h.sendErrorLogsToApex_Helper(c, e, h, c.get("v.recordId"), JSON.stringify(response.getError()), 'ERROR', 'DFJ_JournalForm', 'createRecordOfJournalHistory_helper');
                            }
                        }
                    });
                    $A.enqueueAction(action);
                }
            }else{
                let error = 'Journal not found';
                h.showErrorToast(c,e,h,error);
            }
            } catch (ex) {
                h.sendErrorLogsToApex_Helper(c, e, h, c.get("v.recordId"), JSON.stringify(ex), 'ERROR', 'DFJ_JournalForm', 'createRecordOfJournalHistory_helper');
                console.error('Error--' + ex);
            }
        },
         //Chnages DIN-383 - Improve Journal History
        //Start
        createRecordOfJournalHistoryonOpenJournal_helper: function(c, e, h) {
            try {
                let journalHistoryObject = {};
                let isSetLastEditValueOnLead = c.get("v.isSetLastEditValueOnLead");
                let today = new Date();
                 
                let journalNewData = c.get("v.JournalData");
                let journalId = c.get("v.journalId");
              
                //Journal New Value
                journalHistoryObject.Journal__c =  journalId;
                journalHistoryObject.journal_Deadline_New__c = journalNewData.journal_Deadline__c;
                journalHistoryObject.Journal_States_New__c = journalNewData.Journal_States__c;
                journalHistoryObject.Responsible_lawyer_New__c = journalNewData.Responsible_Lawyer__c;
                //DFJ-160 Changes starts
                journalHistoryObject.Retskreds__c = journalNewData.Retskreds__c;
                //End
                journalHistoryObject.Last_time_journal_was_edited_New__c = today;
               
             
                //Journal Old Value 
                
                if(isSetLastEditValueOnLead){
                    journalHistoryObject.Last_time_journal_was_edited_Old__c = c.get("v.JournalRecordData.LastModifiedDate");  
                }
                if(journalHistoryObject.Journal__c){
                let action = c.get("c.updateJournalHistroyRecord");
                action.setParams({
                    'journalHistoryData': JSON.stringify(journalHistoryObject)
                });
                action.setCallback(this, function(response) {
    
                    let state = response.getState();
                    if (state === 'SUCCESS') {
                        let storedResponse = response.getReturnValue();
                        if (storedResponse != null && storedResponse != undefined && storedResponse != '') {
                            c.set("v.JournalData", Object.assign({}, storedResponse[0]))
                            //let journalRecord =  c.get("v.JournalData");
                            c.set("v.JournalRecordData", Object.assign({}, storedResponse[0]));
                            c.set("v.isSetLastEditValueOnLead", true);
                            
                        } else {
                            //h.showErrorToast(c,e,h);
                            h.sendErrorLogsToApex_Helper(c, e, h, c.get("v.recordId"), JSON.stringify(response.getError()), 'ERROR', 'DFJ_JournalForm', 'createRecordOfJournalHistory_helper');
                        }
                    }
                });
                $A.enqueueAction(action);
                }else{
                    let error = 'Journal not found.';
                    h.showErrorToast(c,e,h,error);
                }
            } catch (ex) {
                h.sendErrorLogsToApex_Helper(c, e, h, c.get("v.recordId"), JSON.stringify(ex), 'ERROR', 'DFJ_JournalForm', 'createRecordOfJournalHistory_helper');
                console.error('Error--' + ex);
            }
        },
    
})