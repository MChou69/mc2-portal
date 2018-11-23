<div class="post">
	<h3>
		<a href="/news/2017/02/01/tip4-testing/">Post Title..</a>
	</h3>
	<div class="news-date news-boxed"> date.. &nbsp; 
		<span class="tags"> 
			<i class="fa fa-tags"></i><a href="/news/tags/tips">tags..</a>
		</span> &nbsp; 
		<i class="fa fa-pencil"></i> MC.
	</div>
	<p></p>
	<div class="content">
		<div id="toc" class="toc">
			<div id="toctitle" class="title">Contents</div>
			<hr />
			<ul class="sectlevel1">
				<li><a href="#_using_weld_in_junit_tests">Using Weld in
						JUnit tests</a></li>
				<li><a href="#_arquillian_as_the_chosen_framework_for_testing">Arquillian
						as the chosen framework for testing</a></li>
				<li><a href="#_java_ee_application_server">Java EE
						application server</a></li>
				<li><a href="#_servlet_environment">Servlet environment</a></li>
				<li><a href="#_java_se_environment">Java SE environment</a></li>
				<li><a href="#_arquillian_weld_embedded_container">Arquillian
						Weld Embedded container</a></li>
			</ul>
		</div>
		<div class="paragraph">
			<p>
				In this follow-up article of our Weld Tips series we are going to
				focus on testing of CDI/Weld applications. Let’s discover options
				for unit testing in the first part and then continue with
				integration testing. To set things straight - by integration testing
				we mean testing in some kind of container and hence in certain
				environment (SE, servlet, full EE server). However, no matter the
				environment we always make use of <a href="http://arquillian.org/">Arquillian</a>
				integration testing framework.
			</p>

				<pre class="prettyprint">
				(function() {
					var jsSyntaxHighlighting = 'rocks';
				})();
				</pre>
			<div class="sect1">
				<h3 id="_using_weld_in_junit_tests">Section Title..</h3>
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
				<h3 id="_arquillian_as_the_chosen_framework_for_testing">Section Title..</h3>
				<div class="sectionbody">
					<div class="paragraph">
						<p>While Arquillian may look complex at first, it is certainly
							worth it. Here are some of the advantages it gives you:</p>
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
								<p>Works well with ShrinkWrap making archive creation and
									deployment a breeze</p>
								<div class="ulist">
									<ul>
										<li>
											<p>
												<a
													href="http://arquillian.org/guides/shrinkwrap_introduction/">ShrinkWrap</a>
												can create any type of deployment archive (WAR, JAR, even
												infamous EAR) with exactly the capabilities you wish it to
												have
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
								<p>Portability - allows to write one test and run it on any
									container</p>
								<div class="ulist">
									<ul>
										<li>
											<p>Arquillian only needs correct adapter; therefore,
												combined with Maven profiles this gives you some nice fire
												power for matrix testing</p>
										</li>
									</ul>
								</div>
							</li>
							<li>
								<p>Allows for very complex testing scenarios</p>
								<div class="ulist">
									<ul>
										<li>
											<p>For instance you can create several deployments which
												you then manually (if you so wish) deploy/undeploy</p>
										</li>
										<li>
											<p>This makes it viable even for cluster testing (session
												replication, failover scenarios, …&#8203;)</p>
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
							If you are a complete Arquillian rookie, you might want to look
							at their <a
								href="http://arquillian.org/guides/getting_started_rinse_and_repeat/">Getting
								started guide</a>. Should you just need an inspiration, you needn’t
							look any further than our <a
								href="https://github.com/weld/core/tree/master/tests-arquillian/src/test/java/org/jboss/weld/tests">testsuite</a>.
							To support the though of Arquillian usefulness for CDI/Weld
							testing, we may also point out that even <a
								href="https://github.com/cdi-spec/cdi-tck/tree/master/impl/src/main/java/org/jboss/cdi/tck/tests">CDI
								TCK tests</a> use it.
						</p>
					</div>
					<div class="paragraph">
						<p>
							Now, let’s take a look at different environments and then round
							it up with <a
								href="https://github.com/arquillian/arquillian-container-weld">Arquillian
								Weld Embedded container</a>, which can be used in each and every
							environment.
						</p>
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
		<a href="#"> <i class="fa fa-rss"></i> Subscribe to news</a>
	</div>
</div>