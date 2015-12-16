package org.vivoweb.vivo.selenium.tests;

import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebElement;

public class CreateOrganization extends AbstractSeleniumTest {
    @Test
    public void createOrganization() {
        deleteAllVisibleCookies();

        open("/");
        assertTitle("VIVO");

        logIn("testAdmin@cornell.edu", "Password");

        clickAndWait(By.linkText("Site Admin"));
        assertTitle("VIVO Site Administration");

        verifyTextPresent("Data Input");

        selectByLabel(By.id("VClassURI"), "College (vivo)");

        clickAndWait(By.xpath("//input[@value='Add individual of this class']"));
        assertTitle("Edit");
        verifyTextPresent("Create a new College");
        verifyTextPresent("Name");

        clickAndWait(By.linkText("Cancel"));

        assertTitle("VIVO Site Administration");

        selectByLabel(By.id("VClassURI"), "College (vivo)");

        clickAndWait(By.xpath("//input[@value='Add individual of this class']"));
        assertTitle("Edit");
        verifyTextPresent("Create a new College");
        verifyTextPresent("Name");

        clickAndWait(By.id("submit"));
        assertTitle("Edit");
        verifyTextPresent("Please enter a value in the Name field.");

        type(By.id("label"), "Primate College of America");

        clickAndWait(By.id("submit"));
        assertTitle("Primate College of America");

        clickAndWait(By.xpath("//h2[@id='overview']/a/img"));
        assertTitle("Edit");

        typeTinyMCE("The Primate College of America is a privately-funded college for the study of primates.");

        clickAndWait(By.id("submit"));
        assertTitle("Primate College of America");

        clickAndWait(By.cssSelector("a.add-offers > img.add-individual"));
        assertTitle("Edit");

        selectByLabel(By.id("objectVar"), "B.S. Bachelor of Science (Academic Degree)");

        clickAndWait(By.id("submit"));
        assertTitle("Primate College of America");

        clickAndWait(By.xpath("//div[@id='wrapper-content']/ul/li[12]"));
        clickAndWait(By.cssSelector("a.add-hasPredecessorOrganization > img.add-individual"));
        assertTitle("Edit");

        selectByLabel(By.id("typeOfNew"), "College (vivo)");
        clickAndWait(By.id("offerCreate"));

        assertTitle("Edit");
        type(By.id("label"), "Primate College of New York");

        clickAndWait(By.id("submit"));
        assertTitle("Primate College of America");

        clickAndWait(By.xpath("//div[@id='wrapper-content']/ul/li[8]"));
        clickAndWait(By.cssSelector("a.add-assigns > img.add-individual"));

        assertTitle("Edit");
        clickAndWait(By.id("offerCreate"));

        assertTitle("Edit");
        type(By.id("label"), "Primate Habitat Research Grant");

        clickAndWait(By.id("submit"));
        assertTitle("Primate College of America");

        clickAndWait(By.cssSelector("li.nonSelectedGroupTab.clickable"));
        clickAndWait(By.cssSelector("a.add-sponsors > img.add-individual"));

        assertTitle("Edit");
        clickAndWait(By.id("offerCreate"));

        assertTitle("Edit");
        type(By.id("label"), "Primate Student of the Year");

        clickAndWait(By.id("submit"));
        assertTitle("Primate College of America");

        clickAndWait(By.cssSelector("a.add-relatedBy > img.add-individual"));

        assertTitle("Edit");
        type(By.id("award"), "Best Primate College");
        clickAndWait(By.xpath("//input[@value='Create Entry']"));

        assertTitle("Primate College of America");
        clickAndWait(By.xpath("//div[@id='wrapper-content']/ul/li[14]"));

        clickAndWait(By.cssSelector("a.add-hasEquipment > img.add-individual"));

        assertTitle("Edit");
        clickAndWait(By.id("offerCreate"));

        assertTitle("Edit");
        type(By.id("label"), "Portable Primate Habitat");

        clickAndWait(By.id("submit"));
        assertTitle("Primate College of America");

        clickAndWait(By.xpath("//div[@id='wrapper-content']/ul/li[8]"));
        clickAndWait(By.cssSelector("a.add-subcontractsGrant > img.add-individual"));

        assertTitle("Edit");
        clickAndWait(By.id("offerCreate"));

        assertTitle("Edit");
        type(By.id("label"), "Primate Survival Planning Grant");

        clickAndWait(By.id("submit"));
        assertTitle("Primate College of America");

        clickAndWait(By.xpath("//div[@id='wrapper-content']/ul/li[4]"));
        clickAndWait(By.cssSelector("a.add-BFO_0000051 > img.add-individual"));

        assertTitle("Edit");
        selectByLabel(By.id("typeOfNew"), "Laboratory (vivo)");

        clickAndWait(By.id("offerCreate"));

        assertTitle("Edit");
        type(By.id("label"), "Primate Research Laboratory");

        clickAndWait(By.id("submit"));
        assertTitle("Primate College of America");

        clickAndWait(By.cssSelector("a.add-BFO_0000051 > img.add-individual"));

        assertTitle("Edit");
        selectByLabel(By.id("typeOfNew"), "Library (vivo)");

        clickAndWait(By.id("offerCreate"));

        assertTitle("Edit");
        type(By.id("label"), "Primate History Library");

        clickAndWait(By.id("submit"));
        assertTitle("Primate College of America");

        clickAndWait(By.cssSelector("#relatedBy-Position > a.add-relatedBy > img.add-individual"));

        assertTitle("Edit");
        type(By.id("positionTitle"), "Dr.");

        selectByLabel(By.id("positionType"), "Faculty Administrative Position");

        type(By.id("person"), "Person");
        type(By.id("firstName"), "Polly");
        type(By.id("startField-year"), "1999");

        clickAndWait(By.id("submit"));
        assertTitle("Primate College of America");

        clickAndWait(By.cssSelector("a.add-RO_0000053 > img.add-individual"));

        assertTitle("Edit");
        type(By.id("typeSelector"), "Company");
        type(By.id("activity"), "Primates-r-us");
        type(By.id("roleLabel"), "Founder");
        type(By.id("startField-year"), "2010");

        clickAndWait(By.id("submit"));
        assertTitle("Primate College of America");

        clickAndWait(By.cssSelector("a.add-affiliatedOrganization > img.add-individual"));

        assertTitle("Edit");
        selectByLabel(By.id("objectVar"), "Primates-r-us (Company)");

        clickAndWait(By.id("submit"));
        assertTitle("Primate College of America");

        clickAndWait(By.xpath("(//img[@alt='add'])[13]"));

        assertTitle("Edit");

        selectByLabel(By.id("typeSelector"), "Consortium");
        type(By.id("activity"), "Primate Colleges of the World");
        type(By.id("roleLabel"), "Member");
        type(By.id("startField-year"), "2009");

        clickAndWait(By.id("submit"));
        assertTitle("Primate College of America");

        clickAndWait(By.cssSelector("a.add-hasCollaborator > img.add-individual"));

        assertTitle("Edit");

        type(By.id("object"), "Primate His");
//        WebElement element;
//        element.sendKeys(Keys.ARROW_DOWN);
//        element.click();

//        try {Thread.sleep(100000); } catch (Exception e) { }
    }
}
/*
<li role="menuitem" class="ui-menu-item"><a tabindex="-1" class="ui-corner-all">Primate History Library (Library)</a></li>
<ul style="z-index: 1; top: 367px; left: 255px; display: block; width: 414px;" aria-activedescendant="ui-active-menuitem" role="listbox" class="ui-autocomplete ui-menu ui-widget ui-widget-content ui-corner-all"><li role="menuitem" class="ui-menu-item"><a tabindex="-1" class="ui-corner-all">Primate History Library (Library)</a></li></ul>
*/


/*
<tr>
<td>click</td>
<td>id=ui-active-menuitem</td>
<td></td>
</tr>
<tr>
<td>clickAndWait</td>
<td>submit</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Primate College of America</td>
<td></td>
</tr>
<tr>
<td>clickAndWait</td>
<td>xpath=(//img[@alt='add'])[14]</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Edit</td>
<td></td>
</tr>
<tr>
<td>select</td>
<td>typeSelector</td>
<td>label=Service</td>
</tr>
<tr>
<td>type</td>
<td>id=activity</td>
<td>Primate Heart Health</td>
</tr>
<tr>
<td>type</td>
<td>roleLabel</td>
<td>Founder</td>
</tr>
<tr>
<td>type</td>
<td>startField-year</td>
<td>2010</td>
</tr>
<tr>
<td>clickAndWait</td>
<td>submit</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Primate College of America</td>
<td></td>
</tr>
<!--Test publications entry-->
<tr>
<td>click</td>
<td>//div[@id='wrapper-content']/ul/li[6]</td>
<td></td>
</tr>
<tr>
<td>clickAndWait</td>
<td>css=a.add-publisherOf &gt; img.add-individual</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Edit</td>
<td></td>
</tr>
<tr>
<td>select</td>
<td>id=typeOfNew</td>
<td>label=Database (vivo)</td>
</tr>
<tr>
<td>clickAndWait</td>
<td>id=offerCreate</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Edit</td>
<td></td>
</tr>
<tr>
<td>type</td>
<td>id=label</td>
<td>Primate Info</td>
</tr>
<tr>
<td>clickAndWait</td>
<td>id=submit</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Primate College of America</td>
<td></td>
</tr>
<tr>
<td>clickAndWait</td>
<td>css=#publicationsGroup &gt; article.property &gt; #RO_0000053 &gt; a.add-RO_0000053 &gt; img.add-individual</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Edit</td>
<td></td>
</tr>
<tr>
<td>select</td>
<td>typeSelector</td>
<td>label=Invited Talk</td>
</tr>
<tr>
<td>type</td>
<td>id=presentation</td>
<td>Primate Health and Fitness</td>
</tr>
<tr>
<td>type</td>
<td>roleLabel</td>
<td>Organizer</td>
</tr>
<tr>
<td>type</td>
<td>startField-year</td>
<td>2008</td>
</tr>
<tr>
<td>clickAndWait</td>
<td>css=input.submit</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Primate College of America</td>
<td></td>
</tr>
<!--Test service entry-->
<tr>
<td>click</td>
<td>//div[@id='wrapper-content']/ul/li[10]</td>
<td></td>
</tr>
<tr>
<td>clickAndWait</td>
<td>css=#serviceGroup &gt; article.property &gt; #RO_0000053 &gt; a.add-RO_0000053 &gt; img.add-individual</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Edit</td>
<td></td>
</tr>
<tr>
<td>select</td>
<td>typeSelector</td>
<td>label=Event</td>
</tr>
<tr>
<td>type</td>
<td>id=activity</td>
<td>Primate Health Check</td>
</tr>
<tr>
<td>type</td>
<td>roleLabel</td>
<td>Sponsor</td>
</tr>
<tr>
<td>type</td>
<td>startField-year</td>
<td>2008</td>
</tr>
<tr>
<td>type</td>
<td>endField-year</td>
<td>2010</td>
</tr>
<tr>
<td>clickAndWait</td>
<td>submit</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Primate College of America</td>
<td></td>
</tr>
<!--Test location entry-->
<tr>
<td>click</td>
<td>//div[@id='wrapper-content']/ul/li[12]</td>
<td></td>
</tr>
<tr>
<td>clickAndWait</td>
<td>css=a.add-RO_0001025 &gt; img.add-individual</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Edit</td>
<td></td>
</tr>
<tr>
<td>type</td>
<td>id=object</td>
<td></td>
</tr>
<tr>
<td>sendKeys</td>
<td>id=object</td>
<td>northern Afr</td>
</tr>
<tr>
<td>pause</td>
<td>5000</td>
<td></td>
</tr>
<tr>
<td>sendKeys</td>
<td>id=object</td>
<td>${KEY_DOWN}</td>
</tr>
<tr>
<td>click</td>
<td>id=ui-active-menuitem</td>
<td></td>
</tr>
<tr>
<td>clickAndWait</td>
<td>submit</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Primate College of America</td>
<td></td>
</tr>
<!--Test contact entry-->
<tr>
<td>clickAndWait</td>
<td>xpath=(//img[@alt='add'])[34]</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Edit</td>
<td></td>
</tr>
<tr>
<td>type</td>
<td>id=emailAddress</td>
<td>info@primates.edu</td>
</tr>
<tr>
<td>clickAndWait</td>
<td>id=submit</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Primate College of America</td>
<td></td>
</tr>
<tr>
<td>clickAndWait</td>
<td>css=article.property &gt; #ARG_2000028 &gt; a.add-ARG_2000028 &gt; img.add-individual</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Edit</td>
<td></td>
</tr>
<tr>
<td>type</td>
<td>id=telephoneNumber</td>
<td>555-555-5555</td>
</tr>
<tr>
<td>clickAndWait</td>
<td>id=submit</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Primate College of America</td>
<td></td>
</tr>
<tr>
<td>clickAndWait</td>
<td>xpath=(//h3[@id='ARG_2000028']/a)[2]</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Edit</td>
<td></td>
</tr>
<tr>
<td>type</td>
<td>id=telephoneNumber</td>
<td>555-555-5554</td>
</tr>
<tr>
<td>clickAndWait</td>
<td>id=submit</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Primate College of America</td>
<td></td>
</tr>
<tr>
<td>clickAndWait</td>
<td>xpath=(//img[@alt='add'])[35]</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Edit</td>
<td></td>
</tr>
<tr>
<td>type</td>
<td>id=streetAddressOne</td>
<td>1234 Northern African Nation</td>
</tr>
<tr>
<td>type</td>
<td>id=city</td>
<td>Morocco City</td>
</tr>
<tr>
<td>type</td>
<td>id=postalCode</td>
<td>1234567890</td>
</tr>
<tr>
<td>type</td>
<td>id=countryEditMode</td>
<td>Morocco</td>
</tr>
<tr>
<td>clickAndWait</td>
<td>id=submit</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Primate College of America</td>
<td></td>
</tr>
<!--Test time entry-->
<tr>
<td>click</td>
<td>css=li.nonSelectedGroupTab.clickable</td>
<td></td>
</tr>
<tr>
<td>clickAndWait</td>
<td>css=a.add-dateTimeInterval &gt; img.add-individual</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Edit</td>
<td></td>
</tr>
<tr>
<td>type</td>
<td>startField-year</td>
<td>1959</td>
</tr>
<tr>
<td>clickAndWait</td>
<td>submit</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Primate College of America</td>
<td></td>
</tr>
<!--Test other entry-->
<tr>
<td>clickAndWait</td>
<td>//h3[@id='abbreviation']/a/img</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Edit</td>
<td></td>
</tr>
<tr>
<td>waitForElementPresent</td>
<td>tinymce</td>
<td></td>
</tr>
<tr>
<td>runScript</td>
<td>tinyMCE.activeEditor.setContent('PCoA')</td>
<td></td>
</tr>
<tr>
<td>clickAndWait</td>
<td>submit</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Primate College of America</td>
<td></td>
</tr>
<tr>
<td>click</td>
<td>//div[@id='wrapper-content']/ul/li[8]</td>
<td></td>
</tr>
<tr>
<td>clickAndWait</td>
<td>//h3[@id='freetextKeyword']/a/img</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Edit</td>
<td></td>
</tr>
<tr>
<td>waitForElementPresent</td>
<td>tinymce</td>
<td></td>
</tr>
<tr>
<td>runScript</td>
<td>tinyMCE.activeEditor.setContent('Gorillas')</td>
<td></td>
</tr>
<tr>
<td>clickAndWait</td>
<td>submit</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Primate College of America</td>
<td></td>
</tr>
<!--Add additional 1.6 fields-->
<tr>
<td>click</td>
<td>css=li.nonSelectedGroupTab.clickable</td>
<td></td>
</tr>
<tr>
<td>clickAndWait</td>
<td>xpath=(//img[@alt='add'])[14]</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Edit</td>
<td></td>
</tr>
<tr>
<td>select</td>
<td>id=typeSelector</td>
<td>label=Workshop</td>
</tr>
<tr>
<td>type</td>
<td>id=activity</td>
<td>New Primate Students </td>
</tr>
<tr>
<td>type</td>
<td>id=startField-year</td>
<td>2003</td>
</tr>
<tr>
<td>type</td>
<td>id=endField-year</td>
<td>2006</td>
</tr>
<tr>
<td>clickAndWait</td>
<td>id=submit</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Primate College of America</td>
<td></td>
</tr>
<tr>
<td>clickAndWait</td>
<td>xpath=(//img[@alt='add'])[15]</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Edit</td>
<td></td>
</tr>
<tr>
<td>select</td>
<td>id=typeSelector</td>
<td>label=Performance</td>
</tr>
<tr>
<td>type</td>
<td>id=activity</td>
<td>Primates in the Wild</td>
</tr>
<tr>
<td>type</td>
<td>id=startField-year</td>
<td>1997</td>
</tr>
<tr>
<td>clickAndWait</td>
<td>id=submit</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Primate College of America</td>
<td></td>
</tr>
<tr>
<td>click</td>
<td>//div[@id='wrapper-content']/ul/li[6]</td>
<td></td>
</tr>
<tr>
<td>clickAndWait</td>
<td>css=a.add-featuredIn &gt; img.add-individual</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Edit</td>
<td></td>
</tr>
<tr>
<td>select</td>
<td>id=typeOfNew</td>
<td>label=Blog Posting (vivo)</td>
</tr>
<tr>
<td>clickAndWait</td>
<td>id=offerCreate</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Edit</td>
<td></td>
</tr>
<tr>
<td>type</td>
<td>id=label</td>
<td>Primate Happenings</td>
</tr>
<tr>
<td>clickAndWait</td>
<td>id=submit</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Primate College of America</td>
<td></td>
</tr>
<tr>
<td>clickAndWait</td>
<td>css=a.add-assigneeFor &gt; img.add-individual</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Edit</td>
<td></td>
</tr>
<tr>
<td>clickAndWait</td>
<td>id=offerCreate</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Edit</td>
<td></td>
</tr>
<tr>
<td>type</td>
<td>id=label</td>
<td>USA222333444555</td>
</tr>
<tr>
<td>clickAndWait</td>
<td>id=submit</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Primate College of America</td>
<td></td>
</tr>
<tr>
<td>clickAndWait</td>
<td>css=a.add-translatorOf &gt; img.add-individual</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Edit</td>
<td></td>
</tr>
<tr>
<td>select</td>
<td>id=objectVar</td>
<td>label=Primate Happenings (Blog Posting)</td>
</tr>
<tr>
<td>clickAndWait</td>
<td>id=submit</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Primate College of America</td>
<td></td>
</tr>
<tr>
<td>click</td>
<td>//div[@id='wrapper-content']/ul/li[8]</td>
<td></td>
</tr>
<tr>
<td>clickAndWait</td>
<td>css=#researchGroup &gt; article.property &gt; #RO_0000053 &gt; a.add-RO_0000053 &gt; img.add-individual</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Edit</td>
<td></td>
</tr>
<tr>
<td>type</td>
<td>id=grant</td>
<td></td>
</tr>
<tr>
<td>sendKeys</td>
<td>id=grant</td>
<td>primate hab</td>
</tr>
<tr>
<td>pause</td>
<td>5000</td>
<td></td>
</tr>
<tr>
<td>sendKeys</td>
<td>id=grant</td>
<td>${KEY_DOWN}</td>
</tr>
<tr>
<td>click</td>
<td>id=ui-active-menuitem</td>
<td></td>
</tr>
<tr>
<td>clickAndWait</td>
<td>css=input.submit</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Primate College of America</td>
<td></td>
</tr>
<tr>
<td>clickAndWait</td>
<td>css=a.add-ERO_0001520 &gt; img.add-individual</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Edit</td>
<td></td>
</tr>
<tr>
<td>clickAndWait</td>
<td>id=offerCreate</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Edit</td>
<td></td>
</tr>
<tr>
<td>type</td>
<td>id=label</td>
<td>Human and Ape Brain Comparison</td>
</tr>
<tr>
<td>clickAndWait</td>
<td>id=submit</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Primate College of America</td>
<td></td>
</tr>
<tr>
<td>click</td>
<td>//div[@id='wrapper-content']/ul/li[10]</td>
<td></td>
</tr>
<tr>
<td>clickAndWait</td>
<td>css=a.add-ERO_0000037 &gt; img.add-individual</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Edit</td>
<td></td>
</tr>
<tr>
<td>select</td>
<td>id=typeOfNew</td>
<td>label=Transport Service (obo)</td>
</tr>
<tr>
<td>clickAndWait</td>
<td>id=offerCreate</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Edit</td>
<td></td>
</tr>
<tr>
<td>type</td>
<td>id=label</td>
<td>Gorilla Moving Company</td>
</tr>
<tr>
<td>clickAndWait</td>
<td>id=submit</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Primate College of America</td>
<td></td>
</tr>
<tr>
<td>clickAndWait</td>
<td>css=#serviceGroup &gt; article.property &gt; #offers &gt; a.add-offers &gt; img.add-individual</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Edit</td>
<td></td>
</tr>
<tr>
<td>clickAndWait</td>
<td>id=offerCreate</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Edit</td>
<td></td>
</tr>
<tr>
<td>type</td>
<td>id=label</td>
<td>Introduction to Primates</td>
</tr>
<tr>
<td>clickAndWait</td>
<td>id=submit</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Primate College of America</td>
<td></td>
</tr>
<tr>
<td>click</td>
<td>//div[@id='wrapper-content']/ul/li[12]</td>
<td></td>
</tr>
<tr>
<td>clickAndWait</td>
<td>css=a.add-hasSuccessorOrganization &gt; img.add-individual</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Edit</td>
<td></td>
</tr>
<tr>
<td>select</td>
<td>id=typeOfNew</td>
<td>label=University (vivo)</td>
</tr>
<tr>
<td>clickAndWait</td>
<td>id=offerCreate</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Edit</td>
<td></td>
</tr>
<tr>
<td>type</td>
<td>id=label</td>
<td>Primate University of America</td>
</tr>
<tr>
<td>clickAndWait</td>
<td>id=submit</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Primate College of America</td>
<td></td>
</tr>
<tr>
<td>clickAndWait</td>
<td>css=a.add-governingAuthorityFor &gt; img.add-individual</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Edit</td>
<td></td>
</tr>
<tr>
<td>type</td>
<td>id=object</td>
<td></td>
</tr>
<tr>
<td>sendKeys</td>
<td>id=object</td>
<td>primate colleges of the wor</td>
</tr>
<tr>
<td>pause</td>
<td>5000</td>
<td></td>
</tr>
<tr>
<td>sendKeys</td>
<td>id=object</td>
<td>${KEY_DOWN}</td>
</tr>
<tr>
<td>click</td>
<td>id=ui-active-menuitem</td>
<td></td>
</tr>
<tr>
<td>clickAndWait</td>
<td>id=submit</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>Primate College of America</td>
<td></td>
</tr>
<!--Verify everything entered is displaying properly-->
<!--Check OVERVIEW tab-->
<tr>
<td>click</td>
<td>css=li.nonSelectedGroupTab.clickable</td>
<td></td>
</tr>
<tr>
<td>verifyTextPresent</td>
<td>PCoA</td>
<td></td>
</tr>
<tr>
<td>verifyTextPresent</td>
<td>1959 -</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=B.S. Bachelor of Science</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Primate Student of the Year</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Best Primate College</td>
<td></td>
</tr>
<!--Check AFFILIATION tab-->
<tr>
<td>click</td>
<td>css=li.nonSelectedGroupTab.clickable</td>
<td></td>
</tr>
<tr>
<td>verifyTextPresent</td>
<td>faculty administrative position</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Person, Polly</td>
<td></td>
</tr>
<tr>
<td>verifyTextPresent</td>
<td>Person, Polly, Dr. 1999 -</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Primate History Library</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Primate Research Laboratory</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Primates-r-us</td>
<td></td>
</tr>
<tr>
<td>verifyTextPresent</td>
<td>Primates-r-us Founder 2010 -</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Primate History Library</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Primates-r-us</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Primate Colleges of the World</td>
<td></td>
</tr>
<tr>
<td>verifyTextPresent</td>
<td>Primate Colleges of the World Member 2009 -</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Primate Heart Health</td>
<td></td>
</tr>
<tr>
<td>verifyTextPresent</td>
<td>Primate Heart Health Founder 2010 -</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=New Primate Students</td>
<td></td>
</tr>
<tr>
<td>verifyTextPresent</td>
<td>New Primate Students 2003 - 2006</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Primates in the Wild</td>
<td></td>
</tr>
<tr>
<td>verifyTextPresent</td>
<td>Primates in the Wild 1997 -</td>
<td></td>
</tr>
<!--Check PUBLICATIONS tab-->
<tr>
<td>click</td>
<td>//div[@id='wrapper-content']/ul/li[6]</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Primate Info</td>
<td></td>
</tr>
<tr>
<td>verifyTextPresent</td>
<td>invited talk</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Primate Health and Fitness</td>
<td></td>
</tr>
<tr>
<td>verifyTextPresent</td>
<td>Primate Health and Fitness, Organizer 2008</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Primate Happenings</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=USA222333444555</td>
<td></td>
</tr>
<!--Check RESEARCH tab-->
<tr>
<td>click</td>
<td>//div[@id='wrapper-content']/ul/li[8]</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Primate Habitat Research Grant</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Primate Habitat Research Grant</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Primate Survival Planning Grant</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Human and Ape Brain Comparison</td>
<td></td>
</tr>
<tr>
<td>verifyTextPresent</td>
<td>Gorillas</td>
<td></td>
</tr>
<!--Check SERVICE tab-->
<tr>
<td>click</td>
<td>//div[@id='wrapper-content']/ul/li[10]</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Gorilla Moving Company</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Primate Health Check</td>
<td></td>
</tr>
<tr>
<td>verifyTextPresent</td>
<td>Primate Health Check Sponsor 2008 - 2010</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Portable Primate Habitat</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Introduction to Primates</td>
<td></td>
</tr>
<!--Check CONTACT tab-->
<tr>
<td>click</td>
<td>//div[@id='wrapper-content']/ul/li[12]</td>
<td></td>
</tr>
<tr>
<td>verifyTextPresent</td>
<td>555-555-5555</td>
<td></td>
</tr>
<tr>
<td>verifyTextPresent</td>
<td>555-555-5554</td>
<td></td>
</tr>
<tr>
<td>verifyTextPresent</td>
<td>info@primates.edu</td>
<td></td>
</tr>
<tr>
<td>verifyTextPresent</td>
<td>1234 Northern African Nation</td>
<td></td>
</tr>
<tr>
<td>verifyTextPresent</td>
<td>Morocco City</td>
<td></td>
</tr>
<tr>
<td>verifyTextPresent</td>
<td>1234567890</td>
<td></td>
</tr>
<tr>
<td>verifyTextPresent</td>
<td>Morocco</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=northern Africa</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Primate College of New York</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Primate University of America</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Primate Colleges of the World</td>
<td></td>
</tr>
<!--Check VIEW ALL tab-->
<tr>
<td>click</td>
<td>//div[@id='wrapper-content']/ul/li[14]</td>
<td></td>
</tr>
<tr>
<td>verifyTextPresent</td>
<td>PCoA</td>
<td></td>
</tr>
<tr>
<td>verifyTextPresent</td>
<td>1959 -</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=B.S. Bachelor of Science</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Primate Student of the Year</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Best Primate College</td>
<td></td>
</tr>
<tr>
<td>verifyTextPresent</td>
<td>faculty administrative position</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Person, Polly</td>
<td></td>
</tr>
<tr>
<td>verifyTextPresent</td>
<td>Person, Polly, Dr. 1999 -</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Primate History Library</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Primate Research Laboratory</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Primates-r-us</td>
<td></td>
</tr>
<tr>
<td>verifyTextPresent</td>
<td>Primates-r-us Founder 2010 -</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Primate History Library</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Primates-r-us</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Primate Colleges of the World</td>
<td></td>
</tr>
<tr>
<td>verifyTextPresent</td>
<td>Primate Colleges of the World Member 2009 -</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Primate Heart Health</td>
<td></td>
</tr>
<tr>
<td>verifyTextPresent</td>
<td>Primate Heart Health Founder 2010 -</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=New Primate Students</td>
<td></td>
</tr>
<tr>
<td>verifyTextPresent</td>
<td>New Primate Students 2003 - 2006</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Primates in the Wild</td>
<td></td>
</tr>
<tr>
<td>verifyTextPresent</td>
<td>Primates in the Wild 1997 -</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Primate Info</td>
<td></td>
</tr>
<tr>
<td>verifyTextPresent</td>
<td>invited talk</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Primate Health and Fitness</td>
<td></td>
</tr>
<tr>
<td>verifyTextPresent</td>
<td>Primate Health and Fitness, Organizer 2008</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Primate Happenings</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=USA222333444555</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Primate Happenings</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Primate Habitat Research Grant</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Primate Habitat Research Grant</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Primate Survival Planning Grant</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Human and Ape Brain Comparison</td>
<td></td>
</tr>
<tr>
<td>verifyTextPresent</td>
<td>Gorillas</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Gorilla Moving Company</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Primate Health Check</td>
<td></td>
</tr>
<tr>
<td>verifyTextPresent</td>
<td>Primate Health Check Sponsor 2008 - 2010</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Portable Primate Habitat</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Introduction to Primates</td>
<td></td>
</tr>
<tr>
<td>verifyTextPresent</td>
<td>555-555-5555</td>
<td></td>
</tr>
<tr>
<td>verifyTextPresent</td>
<td>555-555-5554</td>
<td></td>
</tr>
<tr>
<td>verifyTextPresent</td>
<td>info@primates.edu</td>
<td></td>
</tr>
<tr>
<td>verifyTextPresent</td>
<td>1234 Northern African Nation</td>
<td></td>
</tr>
<tr>
<td>verifyTextPresent</td>
<td>Morocco City</td>
<td></td>
</tr>
<tr>
<td>verifyTextPresent</td>
<td>1234567890</td>
<td></td>
</tr>
<tr>
<td>verifyTextPresent</td>
<td>Morocco</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=northern Africa</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Primate College of New York</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Primate University of America</td>
<td></td>
</tr>
<tr>
<td>verifyElementPresent</td>
<td>link=Primate Colleges of the World</td>
<td></td>
</tr>
<!--Logout-->
<tr>
<td>clickAndWait</td>
<td>link=Home</td>
<td></td>
</tr>
<tr>
<td>clickAndWait</td>
<td>link=Log out</td>
<td></td>
</tr>
<tr>
<td>assertTitle</td>
<td>VIVO</td>
<td></td>
</tr>
</tbody></table>
</body>
</html>
*/