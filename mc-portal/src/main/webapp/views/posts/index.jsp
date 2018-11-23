<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container-fluid">
	<div class="row">

		<div class="col-md-10 col-sm-9">
			<div class="row content-wrapper">
				<div class="col-md-12">
					<div>${post_url}</div>
					<hr/>
					<c:import url="../uploads/${post_url}" />
					
					<!-- div class="post">
						<h3>
							<a href="/news/2017/02/01/tip4-testing/">Weld Tip 4 - Testing
								CDI/Weld apps</a>
						</h3>
						<div class="news-date news-boxed">
							2017-2-1 &nbsp; <span class="tags"> <i class="fa fa-tags"></i>
								<a href="/news/tags/tips">tips</a>
							</span> &nbsp; <i class="fa fa-pencil"></i> Homer Simpson.
						</div>
						<p></p>
						<div class="content">
							<div id="toc" class="toc">
								<div id="toctitle" class="title">Contents</div>
								<hr />
								<ul class="sectlevel1">
									<li><a href="#_using_weld_in_junit_tests">Using Weld
											in JUnit tests</a></li>
									<li><a
										href="#_arquillian_as_the_chosen_framework_for_testing">Arquillian
											as the chosen framework for testing</a></li>
									<li><a href="#_java_ee_application_server">Java EE
											application server</a></li>
									<li><a href="#_servlet_environment">Servlet
											environment</a></li>
									<li><a href="#_java_se_environment">Java SE
											environment</a></li>
									<li><a href="#_arquillian_weld_embedded_container">Arquillian
											Weld Embedded container</a></li>
								</ul>
							</div>
							<div class="paragraph">
								<p>
									In this follow-up article of our Weld Tips series we are going
									to focus on testing of CDI/Weld applications. Let’s discover
									options for unit testing in the first part and then continue
									with integration testing. To set things straight - by
									integration testing we mean testing in some kind of container
									and hence in certain environment (SE, servlet, full EE server).
									However, no matter the environment we always make use of <a
										href="http://arquillian.org/">Arquillian</a> integration
									testing framework.
								</p>

								<pre class="prettyprint">
(function() {
	var jsSyntaxHighlighting = 'rocks';
})();
</pre>

								<pre class="prettyprint">&lt;form&gt;
  &lt;input type="text" id="name" /&gt;
  &lt;input type="button" id="btn-call1-ajax"  value="Envoyer (Async.- GET)"/&gt;
&lt;/form&gt;
</pre>
								<pre class="prettyprint">
package mc.com;

import java.io.File;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({  "/main" })
public class MainServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;
  private static final String SHARED_FOLDER = "views/shared/";
  private static final String VIEW_FOLDER = "views/";

  private static Logger log=Logger.getLogger("Main Servlet!");

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    //arquillian tests
    if(request.getParameter("test")!=null) {
      response.getWriter().print("Hello!");
      return;
    }

    String page = getPageFromRoute(request);

//    log.info("***************************************************************");
//    log.info("Servlet (Main) ==> View to display = "+page);
//    log.info("***************************************************************");

    if(!ViewExists(page)){
      request.setAttribute("error", "404");
      request.setAttribute("message", "Not Found!");
    }
    display(page,request,response);
  }
  private String getPageFromRoute(HttpServletRequest request) {
    String page="";
    if(request.getParameter("category")!=null) {
      page  = VIEW_FOLDER+request.getParameter("category");
      page += (request.getParameter("page")!=null)?"/"+request.getParameter("page"):"/index";
    }else {
      page = (request.getParameter("page")!=null)?VIEW_FOLDER+request.getParameter("page"):VIEW_FOLDER+"main";
    }
    return page+".jsp";
  }
  private boolean ViewExists(String page) {
    String fullPath = this.getServletContext().getRealPath(page);
    try {
      File fview=new File(fullPath);
//      log.info("***************************************************************");
//      log.log(Level.INFO, "File (View) :"+fview.exists()+" "+fview.getAbsolutePath());
//      log.log(Level.INFO, page+ " fullPath : "+fullPath);
//      log.info("***************************************************************");
      return fview.exists();
    } catch (Exception e) {
      log.info("***************************************************************");
      log.log(Level.SEVERE, "Err :"+e.getMessage());
      log.info("***************************************************************");
    }

    return false;
  }
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request, response);
  }

  private void display(String viewName, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setAttribute("title", "title..");
    request.setAttribute("page", viewName.replace("views/", ""));
    String view_to_display=SHARED_FOLDER+"layout.jsp";
    request.getRequestDispatcher(view_to_display).forward(request, response);
  }
}

</pre>



								<div class="sect1">
									<h3 id="_using_weld_in_junit_tests">Using Weld in JUnit
										tests</h3>
									<div class="sectionbody">
										<div class="paragraph">
											<p>
												Recently we created Weld JUnit extension which uses JUnit4
												<code>@Rule</code>
												to initialize a Weld SE container before each test method
												execution. For further information please check following <a
													href="https://developer.jboss.org/people/mkouba/blog/2017/01/24/easy-testing-of-cdi-components-with-weld-and-junit4/">blogpost</a>.
											</p>
										</div>
									</div>
								</div>
								<div class="sect1">
									<h3 id="_arquillian_as_the_chosen_framework_for_testing">Arquillian
										as the chosen framework for testing</h3>
									<div class="sectionbody">
										<div class="paragraph">
											<p>While Arquillian may look complex at first, it is
												certainly worth it. Here are some of the advantages it gives
												you:</p>
										</div>
										<div class="ulist">
											<ul>
												<li>
													<p>
														Allows usage of CDI
														<code>@javax.inject.Inject</code>
														directly in test classes
													</p>
												</li>
												<li>
													<p>Works well with ShrinkWrap making archive creation
														and deployment a breeze</p>
													<div class="ulist">
														<ul>
															<li>
																<p>
																	<a
																		href="http://arquillian.org/guides/shrinkwrap_introduction/">ShrinkWrap</a>
																	can create any type of deployment archive (WAR, JAR,
																	even infamous EAR) with exactly the capabilities you
																	wish it to have
																</p>
															</li>
															<li>
																<p>
																	You can use dedicated
																	<code>beans.xml</code>
																	or
																	<code>@Alternatives</code>
																	for given test case
																</p>
															</li>
														</ul>
													</div>
												</li>
												<li>
													<p>Portability - allows to write one test and run it on
														any container</p>
													<div class="ulist">
														<ul>
															<li>
																<p>Arquillian only needs correct adapter; therefore,
																	combined with Maven profiles this gives you some nice
																	fire power for matrix testing</p>
															</li>
														</ul>
													</div>
												</li>
												<li>
													<p>Allows for very complex testing scenarios</p>
													<div class="ulist">
														<ul>
															<li>
																<p>For instance you can create several deployments
																	which you then manually (if you so wish)
																	deploy/undeploy</p>
															</li>
															<li>
																<p>This makes it viable even for cluster testing
																	(session replication, failover scenarios, …&#8203;)</p>
															</li>
														</ul>
													</div>
												</li>
												<li>
													<p>Can start the application server itself or can just
														connect to running one</p>
												</li>
											</ul>
										</div>
										<div class="paragraph">
											<p>In fact writing tests with Arquillian is quite
												straightforward. It’s basically about right usage of right
												annotations. Basic test could like this: [ source, java ]</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre> package org.arquillian.example;

                         import javax.inject.Inject;
                         import org.jboss.arquillian.container.test.api.Deployment;
                         import org.jboss.arquillian.junit.Arquillian;
                         import org.jboss.shrinkwrap.api.ShrinkWrap;
                         import org.jboss.shrinkwrap.api.asset.EmptyAsset;
                         import org.jboss.shrinkwrap.api.spec.JavaArchive;
                         import org.junit.Assert;
                         import org.junit.Test;
                         import org.junit.runner.RunWith;

                         @RunWith(Arquillian.class)
                         public class GreeterTest {

                             // This static method builds the virtual test deployment archive
                             @Deployment
                             public static JavaArchive createDeployment() {
                                 return ShrinkWrap.create(JavaArchive.class)
                                     .addClass(Greeter.class)
                                     .addAsManifestResource(EmptyAsset.INSTANCE, "beans.xml");
                             }

                             @Inject
                             Greeter greeter;

                             @Test
                             public void should_create_greeting() {
                                Assert.assertEquals("Hello, Earthling!", greeter.createGreeting("Earthling"));
                             }
                         }</pre>
											</div>
										</div>
										<div class="paragraph">
											<p>
												If you are a complete Arquillian rookie, you might want to
												look at their <a
													href="http://arquillian.org/guides/getting_started_rinse_and_repeat/">Getting
													started guide</a>. Should you just need an inspiration, you
												needn’t look any further than our <a
													href="https://github.com/weld/core/tree/master/tests-arquillian/src/test/java/org/jboss/weld/tests">testsuite</a>.
												To support the though of Arquillian usefulness for CDI/Weld
												testing, we may also point out that even <a
													href="https://github.com/cdi-spec/cdi-tck/tree/master/impl/src/main/java/org/jboss/cdi/tck/tests">CDI
													TCK tests</a> use it.
											</p>
										</div>
										<div class="paragraph">
											<p>
												Now, let’s take a look at different environments and then
												round it up with <a
													href="https://github.com/arquillian/arquillian-container-weld">Arquillian
													Weld Embedded container</a>, which can be used in each and
												every environment.
											</p>
										</div>
									</div>
								</div>
								<div class="sect1">
									<h3 id="_java_ee_application_server">Java EE application
										server</h3>
									<div class="sectionbody">
										<div class="paragraph">
											<p>
												When you want to test your application in Java EE
												application server you basically need to create your test
												deployment archive, deploy it, execute the test and undeploy
												the archive. As stated above, <a
													href="http://arquillian.org/modules/shrinkwrap-shrinkwrap/">ShrinkWrap</a>
												covers the archive creation (typically WAR or EAR). When it
												comes to deployment/undeployment, Arquillian controls that,
												unless you take the reins and control it yourself - just
												keep an eye for dangling deployments. You also get to chose
												between using so called managed container, where Arquillian
												starts and stops the desired container for you, and remote
												container where Arquillian tries to connect to already
												running container. Since we are talking Java EE application
												server, you can use CDI out of the box. Just pay attention
												to <a
													href="https://docs.jboss.org/author/display/ARQ/Test+run+modes">test
													mode</a> you are using. You can check available Arquillian
												container adapters <a href="http://arquillian.org/modules/">here</a>.
											</p>
										</div>
										<div class="paragraph">
											<p>For example to use Arquillian WildFly Managed
												container you need to define following dependency: [ source,
												xml ]</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre>               &lt;dependency&gt;
                       &lt;groupId&gt;org.wildfly.arquillian&lt;/groupId&gt;
                       &lt;artifactId&gt;wildfly-arquillian-container-managed&lt;/artifactId&gt;
                       &lt;version&gt;1.1.0.Final&lt;/version&gt;
                       &lt;scope&gt;test&lt;/scope&gt;
                   &lt;/dependency&gt;</pre>
											</div>
										</div>
									</div>
								</div>
								<div class="sect1">
									<h3 id="_servlet_environment">Servlet environment</h3>
									<div class="sectionbody">
										<div class="paragraph">
											<p>
												In basic Servlet environment you need to deploy all the
												dependencies of Weld Servlet integration (as CDI API,
												Interceptors API, etc.) to your Servlet container and thus
												embedded container option could be sufficient. As you can <a
													href="http://arquillian.org/modules/">see</a> Arquillian
												offers embedded container adapters for all well known
												Servlet containers such as Tomcat, Jetty and Undertow.
											</p>
										</div>
										<div class="paragraph">
											<p>For example to use Arquillian Embedded Tomcat
												container you need to define following dependency: [ source,
												xml ]</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre>               &lt;dependency&gt;
                        &lt;groupId&gt;org.jboss.arquillian.container&lt;/groupId&gt;
                        &lt;artifactId&gt;arquillian-tomcat-embedded-8&lt;/artifactId&gt;
                        &lt;version&gt;1.0.0.CR8&lt;/version&gt;
                        &lt;scope&gt;test&lt;/scope&gt;
                    &lt;/dependency&gt;</pre>
											</div>
										</div>
									</div>
								</div>
								<div class="sect1">
									<h3 id="_java_se_environment">Java SE environment</h3>
									<div class="sectionbody">
										<div class="paragraph">
											<p>
												Java SE is not effectively a container, however it could be
												very handy to have an option to easily configure classpath
												elements of your test. This is exactly what <a
													href="https://github.com/arquillian/arquillian-container-se">Arquillian
													container SE</a> offers. With this extension you can build your
												test classpath and the test executes remotely over JMX in
												new isolated JVM process. You can find basic information in
												<a
													href="https://github.com/arquillian/arquillian-container-se/blob/master/README.adoc">README</a>
												or you can take look into already mentioned <a
													href="https://github.com/cdi-spec/cdi-tck/tree/master/impl/src/main/java/org/jboss/cdi/tck/tests">CDI
													TCK tests</a> where you can find <a
													href="https://github.com/cdi-spec/cdi-tck/blob/master/impl/src/main/java/org/jboss/cdi/tck/TestGroups.java#L100">SE
													testgroup</a> which involves all SE related tests.
											</p>
										</div>
										<div class="paragraph">
											<p>The maven dependency for this extension looks like
												this: [ source, xml ]</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre>               &lt;dependency&gt;
                       &lt;groupId&gt;org.jboss.arquillian.container&lt;/groupId&gt;
                       &lt;artifactId&gt;container-se-managed&lt;/artifactId&gt;
                       &lt;version&gt;1.0.1.Final&lt;/version&gt;
                   &lt;/dependency&gt;</pre>
											</div>
										</div>
									</div>
								</div>
								<div class="sect1">
									<h3 id="_arquillian_weld_embedded_container">Arquillian
										Weld Embedded container</h3>
									<div class="sectionbody">
										<div class="paragraph">
											<p>
												First of all - this test container is suitable in situations
												when you know you don’t need to work with full Java EE
												application server and you are OK with dummy mock EJB, JTA,
												JPA etc. services. As stated in the beginning of this
												article, you can use it for any environment but you have to
												keep it mind, that other technologies/services will be
												mocked only. By default, this container operates in SE mode,
												as you don’t need to mock anything there, but you can use a
												system property (
												<code>Denvironment=EE</code>
												) or a programmatic approach in order to make it work in
												other environments. For full list of supported environments,
												see <a
													href="https://github.com/weld/api/blob/master/weld-spi/src/main/java/org/jboss/weld/bootstrap/api/Environments.java"><code>Environments.java</code></a>.
												We recommend you to take a glance at <a
													href="https://github.com/arquillian/arquillian-container-weld/blob/master/README.adoc">README</a>
												file - especially those few lines about flat deployment
												structure (this means this container is not very suitable
												for testing EAR deployments) and configuration property for
												setting testing environment.
											</p>
										</div>
										<div class="paragraph">
											<p>The maven dependency for this container could look
												like this: [ source, xml ]</p>
										</div>
										<div class="listingblock">
											<div class="content">
												<pre>      &lt;dependency&gt;
					                        &lt;groupId&gt;org.jboss.arquillian.container&lt;/groupId&gt;
					                        &lt;artifactId&gt;arquillian-weld-embedded&lt;/artifactId&gt;
					                        &lt;version&gt;2.0.0.Beta4&lt;/version&gt;
					                        &lt;scope&gt;test&lt;/scope&gt;
					                    &lt;/dependency&gt;
					             </pre>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="pagination-links">
                  <span class="current-page">1</span>
                  </div>
						<hr />
						<div>
							<a href="#"> <i class="fa fa-rss"></i> Subscribe to news
							</a>
						</div>
						<hr />
					</div-->
					
				</div>
				</div>
			</div>


			<div class="col-md-2 col-sm-3">
				<div class="sidebar-nav">
					<div class="navbar navbar-default" role="navigation">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle"
								data-target=".sidebar-navbar-collapse" data-toggle="collapse">
								<span class="sr-only"> Toggle navigation </span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span> <span class="icon-bar"></span>
							</button>
							<a class="visible-xs navbar-brand"> <img
								src="<c:url value='/static/jee.png' />" class="logo" />
							</a>
						</div>
						<div class="collapse navbar-collapse sidebar-navbar-collapse">
							<ul class="nav navbar-nav">
								<li><a href="/"> <i class="fa fa-home"></i> &nbsp;Home
								</a></li>
								<li><a href="/download"> <i class="fa fa-download"></i>
										&nbsp;Download
								</a></li>
								<li><a href="/news"> <i class="fa fa-newspaper-o"></i>
										&nbsp;News
								</a></li>
								<li><a
									href="https://issues.jboss.org/projects/WELD?selectedItem=com.atlassian.jira.jira-projects-plugin:release-page"
									target="_blank"> <i class="fa fa-road"></i> &nbsp;Road Map
								</a></li>
								<li><a href="/documentation"> <i class="fa fa-book"></i>
										&nbsp;Docs &amp; FAQ
								</a></li>
								<li><a href="/news/tags/tips"> <i
										class="fa fa-lightbulb-o"></i> &nbsp;Tips and Tricks
								</a></li>
								<li><a href="/community"> <i class="fa fa-group"></i>
										&nbsp;Community
								</a></li>
								<li><a href="http://github.com/weld" target="_blank"> <i
										class="fa fa-github-alt"></i> &nbsp;Source Code
								</a></li>
								<li><a
									href="https://issues.jboss.org/browse/WELD#selectedTab=com.atlassian.jira.plugin.system.project%3Asummary-panel"
									target="_blank"> <i class="fa fa-tasks"></i> &nbsp;Bug
										Tracker
								</a></li>
								<li><a href="https://twitter.com/jbossweld" target="_blank">
										<i class="fa fa-twitter"></i> &nbsp;Follow @jbossweld
								</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>