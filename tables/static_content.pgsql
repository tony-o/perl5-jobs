create table if not exists static_content (
  spath varchar(40) NOT NULL UNIQUE,
  scontent text
);

truncate table static_content;

insert into static_content (spath, scontent) values ('/', '

    <div class="jumbotron">
        <br>
        <img src="/imgs/NYBeachiPhone.jpg" style="width:100%;">
        
    </div>
    
    
        
        <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <h2>Key Features</h2>
                    <br>&nbsp;<br>
                    <p><img src="/imgs/bullet40x37.png" style="padding-right:20px; vertical-align:middle; width:50px; height:auto;" /><big>Create a Profile and you''ll never have to look for another job again.</big><br><br></p>
                    <p><img src="/imgs/bullet40x37.png" style="padding-right:20px; vertical-align:middle; width:50px; height:auto;" /><big>Use your Dashboard to track progress and discover your ranking for each matched job.</big><br><br></p>
                    <p><img src="/imgs/bullet40x37.png" style="padding-right:20px; vertical-align:middle; width:50px; height:auto;" /><big>Your Profile is always presented <b>anonymously</b>.</big><br><br></p>
                    <p><img src="/imgs/bullet40x37.png" style="padding-right:20px; vertical-align:middle; width:50px; height:auto;" /><big>Identify the missing skills you need to succeed from top-rated competitor Profiles.</big><br><br></p>


                    <h2>Create Your Profile</h2>
                    <br>&nbsp;<br>

                    <p><img src="/imgs/bullet40x37.png" style="padding-right:20px; vertical-align:middle; width:50px; height:auto;" /><big>Personality Test:  In under 10 minutes let potential employers discover the real you.  </big><br><br></p>
                    <p><img src="/imgs/bullet40x37.png" style="padding-right:20px; vertical-align:middle; width:50px; height:auto;" /><big>Experience/Skills/Education:  Import from LinkedIn or use Copy/Paste.</big><br><br></p>
                    <p><img src="/imgs/bullet40x37.png" style="padding-right:20px; vertical-align:middle; width:50px; height:auto;" /><big>Select Job Titles: Our automated system will match you to your ideal job.  </big><br><br></p>
                    <p><img src="/imgs/bullet40x37.png" style="padding-right:20px; vertical-align:middle; width:50px; height:auto;" /><big>Share with peers and social networks.  </big></p>

                    <p>
                        <br>
                        <form action="register.html">
                            <button class="btn btn-default navbar-btn register-button">Sign-Up Now to Get Started</button>
                        </form>
                    </p>


                    <!-- need some padding -->
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>

                </div>
            </div>
            <!-- /.row -->

        </div>
        <!-- /.container -->
');

insert into static_content (spath, scontent) values ('/privacy_policy', '
    <!-- header goes here -->
    
    <div class="container">

        <div class="row">

            <div class="col-lg-12">
                <h1 class="page-header">Privacy Policy
                    
                </h1>
                <ol class="breadcrumb">
                    <li><a href="/">Home</a>
                    </li>
                    <li class="active">Privacy Policy</li>
                </ol>
            </div>

        </div>

        <div class="row">

            <div class="col-lg-12">
                <div style="font-family: arial;"><small><strong>What information do we collect?</strong> <br>
                <br>
                We collect information from you when you register on our site, place an
                order, subscribe to our newsletter, respond to a survey or fill out a
                form. <br>
                <br>
                When ordering or registering on our site, as
                appropriate, you may be asked to enter your: name, e-mail address,
                mailing address or credit card information. You may, however, visit our
                site anonymously.<br>
                <br>
                <strong>What do we use your information for?</strong>
                <br>
                <br>
                Any of the information we collect from you may be used in one of the
                following ways: <br>
                <br>
                - To personalize your experience<br>
                (your information helps us to better respond to your individual needs)<br>
                <br>
                -&nbsp;To improve our website<br>
                (we continually strive to improve our website offerings based on the
                information and feedback we receive from you)<br>
                <br>
                -&nbsp;To improve customer service<br>
                (your information helps us to more effectively respond to your customer
                service requests and support needs)<br>
                <br>
                -&nbsp;To process transactions<br>
                </small>
                <blockquote><small>Your
                information, whether public or private, will not be sold, exchanged,
                transferred, or given to any other company for any reason whatsoever,
                without your consent, other than for the express purpose of delivering
                the purchased product or service requested.</small></blockquote>
                <small>-&nbsp;To administer a contest, promotion,
                survey or other site feature<br>
                <br>
                -&nbsp;To send periodic emails<br>
                </small>
                <blockquote><small>The
                email address you provide for order processing, may be used to send you
                information and updates pertaining to your order, in addition to
                receiving occasional company news, updates, related product or service
                information, etc.</small></blockquote>
                <small>Note: If at any time you
                would like to unsubscribe from receiving future emails, we include
                detailed unsubscribe instructions at the bottom of each email.<br>
                <br>
                <strong>How do we protect your information?</strong> <br>
                <br>
                We implement a variety of security measures to maintain the safety of your
                personal information when you place an order or enter, submit, or
                access your personal information. <br>
                <br>
                We offer the use of a secure
                server. All supplied sensitive/credit information is transmitted via
                Secure Socket Layer (SSL) technology and then encrypted into our
                Payment gateway providers database only to be accessible by those
                authorized with special access rights to such systems, and are required
                to keep the information confidential.<br>
                <br>
                After a transaction, your
                private information (credit cards, social security numbers, financials,
                etc.) will not be kept on file for more than 60 days.<br>
                <br>
                <strong>Do we use cookies?</strong> <br>
                <br>
                Yes
                (Cookies are small files that a site or its service provider transfers
                to your computers hard drive through your Web browser (if you allow)
                that enables the sites or service providers systems to recognize your
                browser and capture and remember certain information<br>
                <br>
                We use
                cookies to help us remember and process the items in your shopping
                cart, understand and save your preferences for future visits and
                compile aggregate data about site traffic and site interaction so that
                we can offer better site experiences and tools in the future. We may
                contract with third-party service providers to assist us in better
                understanding our site visitors. These service providers are not
                permitted to use the information collected on our behalf except to help
                us conduct and improve our business.<br>
                <br>
                <strong>Do we disclose any information to outside parties?</strong>
                <br>
                <br>
                We
                do not sell, trade, or otherwise transfer to outside parties your
                personally identifiable information. This does not include trusted
                third parties who assist us in operating our website, conducting our
                business, or servicing you, so long as those parties agree to keep this
                information confidential. We may also release your information when we
                believe release is appropriate to comply with the law, enforce our site
                policies, or protect ours or others rights, property, or safety.
                However, non-personally identifiable visitor information may be
                provided to other parties for marketing, advertising, or other uses.<br>
                <br>
                <strong>Third party links</strong> <br>
                <br>
                Occasionally, at our discretion, we may include or offer third party
                products or services on our website. These third party sites have
                separate and independent privacy policies. We therefore have no
                responsibility or liability for the content and activities of these
                linked sites. Nonetheless, we seek to protect the integrity of our site
                and welcome any feedback about these sites.<br>
                <br>
                <strong>California Online Privacy Protection Act Compliance</strong><br>
                <br>
                Because
                we value your privacy we have taken the necessary precautions to be in
                compliance with the California Online Privacy Protection Act. We
                therefore will not distribute your personal information to outside
                parties without your consent.<br>
                <br>
                As part of the California Online
                Privacy Protection Act, all users of our site may make any changes to
                their information at anytime by logging into their control panel and
                going to the ''Edit Profile'' page.<br>
                <br>
                <strong>Childrens Online Privacy Protection Act Compliance</strong>
                <br>
                <br>
                We
                are in compliance with the requirements of COPPA (Childrens Online
                Privacy Protection Act), we do not collect any information from anyone
                under 13 years of age. Our website, products and services are all
                directed to people who are at least 13 years old or older.<br>
                <br>
                <strong>Online Privacy Policy Only</strong> <br>
                <br>
                This online privacy policy applies only to information collected
                through our website and not to information collected offline.<br>
                <br>
                <strong>Terms and Conditions</strong> <br>
                <br>
                Please
                also visit our Terms and Conditions section establishing the use,
                disclaimers, and limitations of liability governing the use of our
                website at <a href="http://www.hirenetics.com">http://www.hirenetics.com</a><br>
                <br>
                <strong>Your Consent</strong> <br>
                <br>
                By using our site, you consent to our <a style="text-decoration: none; color: rgb(60, 60, 60);" href="http://www.freeprivacypolicy.com/" target="_blank">online
                privacy policy</a>.<br>
                <br>
                <strong>Changes to our Privacy Policy</strong> <br>
                <br>
                If we decide to change our privacy policy, we will post those changes
                on this page. <br>
                </small> 


            </div>

        </div>

    </div>
    <!-- /.container -->

  </div>

    <!-- footer here -->

');

insert into static_content (spath, scontent) values ('/about', '
    <div class="container">


            <div class="row">

                        <div class="col-lg-12">
                                        <div style="font-family: arial;">
                                                            <p><big>Are you tired of wasting time looking for qualified candidates for your company’s job openings? Stop wasting time with stacks of resumes and dead-end phone calls. Get a quality list of pre-ranked candidates from our new online tool. Hirenetics is the new online job matching service that connects your current job openings to profiles from top talent.</big> </p>

                                                                                <p><big>Hirenetics’ unique ranking algorithms sort candidates based on their personality and qualifications. Pre-screen your matches by requesting video responses to your pre-interview questions. All you’ve got left to do is to schedule face-to-face interviews with the top candidates.</big> </p>

                                                                                                    <p><big>HR professionals will love this quick, and easy tool to streamline the hiring process, effectively shortlisting top talent.</big></p>

                                                                                                                        <p><big>Job seekers will love our automated system. Matching you to your selected job titles as they are posted. Managing the dashboard is simple, and for the first time ever analyze your competition to see how you rank and discover missing skills.</big></p>

                                                                                                                                            <p><big>Try out Hirenetics today. What are you waiting for?  Your ideal job is one click away from your smartphone, tablet, or computer!</big></p>

                                                                                                                                                                <p><br></p>
                                                                                                                                                                                    <p><br></p>
                                                                                                                                                                                                        <p><br></p>


                                                                                                                                                                                                                    </div>

                                                                                                                                                                                                                            </div>

                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                    <!-- /.container -->
                                                                                                                                                                                                                                    ');


insert into static_content (spath, scontent) values ('/team', '
    <!-- header goes here -->
    
    <div class="container">

        <div class="row">

            <div class="col-lg-12">
                <h1 class="page-header">Team</h1>

                <ol class="breadcrumb">
                    <li><a href="index.html">Home</a>
                    </li>
                    <li class="active">Team</li>
                </ol>
            </div>

        </div>
        <!-- /.row -->

        <div class="row">

            <div class="col-md-4 portfolio-item">
                
                <img class="img-responsive" src="/imgs/Joel_Photo.jpg">
                
                <h3>Joel Shapiro</h3>
                <p>Joel has 15 years of experience in network IT and project management along with being a web developer for Insurance Telegraph and an employee at Watson Wyatt Worldwide.  He holds a BS in Geology from the College of Charleston.  When Joel isn’t working he’s riding a custom-made road bike or playing his bass.  Contact <a href="mailto:joel@hirenetics.com">Joel Shapiro</a>.</p>
            </div>

            <div class="col-md-4 portfolio-item">
                
                <img class="img-responsive" src="/imgs/JayBiz2013.jpg">
                
                <h3>Jay Davies</h3>
                <p>Jay started his first business out of his parent’s house selling skateboards as a freshman in high school.  With a decade of record industry experience, he became GM at Cement Shoes Records distributed by Fontana, a Universal Company.  He’s an endurance cyclist and serial entrepreneur with BA in Communications from Cal.  Contact <a href="mailto:jay@hirenetics.com">Jay Davies</a>.</p>
            </div>

            <div class="col-md-4 portfolio-item">
                
                    <img class="img-responsive" src="/imgs/tony_small_bw-200x300.jpg">
                
                <h3>Tony O''Dell</h3>
                <p>Tony is a US Marine who has been coding since his pre-teen years.  He developed the software framework for Hirenetics along with heading the Business Intelligence team.  Tony races road bikes in his free time.  Contact <a href="tony@hirenetics.com">Tony O''Dell</a>. </p>
            </div>

        </div>

        

        <hr>

       

    </div>
    <!-- /.container -->

    <div class="container">

        <hr>

        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Hirenetics 2014</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

    <!-- footer goes here -->
    
');

insert into static_content (spath, scontent) values ('/terms', '

<!-- header goes here -->
    
    
    <div class="container">

        <div class="row">

            <div class="col-lg-12">
                <h1 class="page-header">Terms of Service
                    
                </h1>
                <ol class="breadcrumb">
                    <li><a href="/">Home</a>
                    </li>
                    <li class="active">Terms</li>
                </ol>
            </div>

        </div>

        <div class="row">

            <div class="col-lg-12">
                <p>1 Acceptance of Terms.</p>

                <p>1.1 Hirenetics provides its Service (as defined below) to you through its web site located at www.hirenetics.com (the "Site"), subject to this Terms of Service agreement ("TOS"). By accepting this TOS or by accessing or using the Service or Site, you acknowledge that you have read, understood, and agree to be bound by this TOS. If you do not have such authority, or if you do not agree with this TOS, you must not accept this TOS and may not use the Service.</p>

                <p>1.2 Hirenetics may change this TOS from time to time without prior notice. You can review the most current version of this TOS at any time at http://www.hirenetics.com/terms_conditions. The revised terms and conditions will become effective upon posting and if you use the Service after that date, your use will constitute acceptance of the revised terms and conditions. If any change to this TOS is not acceptable to you, your only remedy is to stop accessing and using the Service.
                </p>

                <p>2 Description of Service. The "Service" includes (a) the Site, (b) the employment and recruitment-related services, tools and other services provided through the Site, and (c) all software, data, text, images, sounds, video, and content made available through the Site (collectively referred to as the "Content"). Any new features added to or augmenting the Service are also subject to this TOS.</p>

                <p>3 General Conditions/Access and Use of the Service.</p>

                <p>3.1 Subject to the terms and conditions of this TOS, you may access and use the Service only for lawful purposes. Subject only to the foregoing, all rights, title and interest in and to the Service and its components will remain with and belong exclusively to Hirenetics. You shall not (a) sublicense, resell, rent, lease, transfer, assign, time share or otherwise commercially exploit or make the Service available to any third party; (b) use the Service in any unlawful manner (including without limitation in violation of any data, privacy or export control laws) or in any manner that interferes with or disrupts the integrity or performance of the Service or its components, or (c) modify, adapt or hack the Service to falsely imply any sponsorship or association with Hirenetics, or otherwise attempt to gain unauthorized access to the Service or its related systems or networks. You shall comply with any codes of conduct, policies or other notices Hirenetics provides you or publishes on the Site, and you shall promptly notify Hirenetics if you learn of a security breach related to the Service.
                </p>

                <p>3.2 We may own the Content or portions of the Content may be made available to us through arrangements that we have with third-parties (including potential employers). The Content is protected by United States and foreign intellectual property laws. Unauthorized use of the Content may result in violation of copyright, trademark, and other laws. You have no rights in or to the Content, and you will not use, copy or display the Content except as permitted under this Agreement in connection with the Services. No other use is permitted without our prior written consent. You must retain all copyright and other proprietary notices contained in the original Content on any copy you make of the Content. You may not sell, transfer, assign, license, sublicense, or modify the Content or reproduce, display, publicly perform, make a derivative version of, distribute, or otherwise use the Content in any way for any public or commercial purpose. The use or posting of any of the Content on any other web site or in a networked computer environment for any purpose is expressly prohibited.</p>

                <p>3.3 You are solely responsible for all data, information, answers, text and other materials that you upload, post or otherwise transmit or store via the Service ("Your Content"). You hereby grant to Hirenetics a worldwide, non-exclusive, sublicenseable, assignable, royalty-free, perpetual, irrevocable right (including moral rights) and license to use, reproduce, distribute, create derivative works based on, perform and/or display Your Content (in whole or in part) in connection with the operation of the Service or the promotion, advertising, or marketing thereof, in any media now known or hereafter developed, without compensation to you. You are responsible for maintaining the confidentiality of your login, password and account and for all activities that occur under your login or account.  Hirenetics reserves the right to access your account in order to respond to your requests for technical support. From time to time you may give Hirenetics suggestions or feedback about the Service. If you do so, you hereby grant to Hirenetics a worldwide, non-exclusive, sublicensable, assignable, royalty-free, perpetual, paid-up, irrevocable right (including moral rights) and license to fully exercise and exploit such suggestions or feedback (and all related rights) for any purpose.</p>

                <p>3.4 You understand that the operation of the Service, including Your Content, may be unencrypted and involve (a) transmissions over various networks; (b) changes to conform and adapt to technical requirements of connecting networks or devices and (c) transmission to Hirenetics''s third party vendors and hosting partners to provide the necessary hardware, software, networking, storage, and related technology required to operate and maintain the Service. Although Hirenetics strives to keep Your Content secure, given the nature of the Internet, Hirenetics cannot guarantee that Hirenetics will be successful in doing so. Accordingly, you acknowledge that you bear sole responsibility for adequate security, protection and backup of Your Content. Hirenetics will have no liability to you for any unauthorized access or use of any of Your Content, or any corruption, deletion, destruction or loss of any of Your Content.</p>

                <p>3.5 The failure of Hirenetics to exercise or enforce any right or provision of this TOS shall not be a waiver of that right. You acknowledge that this TOS is a contract between you and Hirenetics, even though it is electronic and is not physically signed by you and Hirenetics, and it governs your use of the Service and takes the place of any prior agreements between you and Hirenetics.</p>

                <p>4 Trademarks. No license or right to use any trademark of Hirenetics or any third party is granted to you in connection with the Service.</p>

                <p>5 Representations and Warranties. You represent and warrant to Hirenetics that (i) you have full power and authority to enter into this TOS; (ii) you own all Your Content or have obtained all permissions, releases, rights or licenses required to engage in your activities in connection with (and allow Hirenetics to perform) the Services without obtaining any further releases or consents; (iii) Your Content and other activities in connection with the Service do not and will not violate, infringe, or misappropriate any third party''s copyright, trademark, right of privacy or publicity, or other personal or proprietary right,  nor does Your Content contain any matter that is defamatory, obscene, unlawful, threatening, abusive, tortious, offensive or harassing; and (iv) you are eighteen (18) years of age or older.</p>

                <p>6 Termination. You are responsible for properly terminating your account. Hirenetics reserves the right to (i) modify or discontinue, temporarily or permanently, the Service (or any part thereof) and (ii) refuse any and all current and future use of the Service, suspend or terminate your account (any part thereof) or use of the Service and remove and discard any of Your Content in the Service, for any reason, including if Hirenetics believes that you have violated this TOS. Hirenetics shall not be liable to you or any third party for any modification, suspension or discontinuation of the Service. All of Your Content on the Service may be permanently deleted by Hirenetics upon any termination of your account in its sole discretion.</p>

                <p>7 DISCLAIMER OF WARRANTIES. THE SERVICE, INCLUDING THE SITE AND CONTENT, AND ALL SERVER AND NETWORK COMPONENTS ARE PROVIDED ON AN "AS IS" AND "AS AVAILABLE" BASIS WITHOUT ANY WARRANTIES OF ANY KIND, AND HIRENETICS EXPRESSLY DISCLAIMS ANY AND ALL WARRANTIES, WHETHER EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, TITLE, FITNESS FOR A PARTICULAR PURPOSE, AND NON-INFRINGEMENT. YOU ACKNOWLEDGE THAT HIRENETICS DOES NOT WARRANT THAT THE SERVICE WILL BE UNINTERRUPTED, TIMELY, SECURE, ERROR-FREE OR VIRUS-FREE AND NO INFORMATION, ADVICE OR SERVICES OBTAINED BY YOU FROM HIRENETICS OR THROUGH THE SERVICE SHALL CREATE ANY WARRANTY NOT EXPRESSLY STATED IN THIS TOS. FURTHER, HIRENETICS DOES NOT GUARANTEE THAT YOU WILL OBTAIN ANY EMPLOYMENT OR OFFERS FOR EMPLOYMENT THROUGH THE SERVICE.</p>

                <p>8 LIMITATION OF LIABILITY.</p>

                <p>8.1 UNDER NO CIRCUMSTANCES AND UNDER NO LEGAL THEORY (WHETHER IN CONTRACT, TORT, OR OTHERWISE) SHALL HIRENETICS BE LIABLE TO YOU OR ANY THIRD PARTY FOR ANY INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, CONSEQUENTIAL OR PUNITIVE DAMAGES, INCLUDING LOST PROFITS, LOST SALES OR BUSINESS, LOST DATA OR BUSINESS INTERRUPTION. IN ADDITION, HIRENETICS SHALL NOT BE LIABLE FOR ANY DIRECT DAMAGES, COSTS, LOSSES OR LIABILITIES IN EXCESS OF ONE HUNDRED ($100) U.S. DOLLARS. THE PROVISIONS OF THIS SECTION ALLOCATE THE RISKS UNDER THIS TOS BETWEEN THE PARTIES, AND THE PARTIES HAVE RELIED ON THESE LIMITATIONS IN DETERMINING WHETHER TO ENTER INTO THIS AGREEMENT.</p>

                <p>8.2 Some states do not allow the exclusion of implied warranties or limitation of liability for incidental or consequential damages, which means that some of the above limitations may not apply to you. IN THESE STATES, HIRENETICS'' LIABILITY WILL BE LIMITED TO THE GREATEST EXTENT PERMITTED BY LAW.</p>

                <p>9 Indemnification. You shall defend, indemnify, and hold harmless Hirenetics from and against any claims, actions or demands, including without limitation reasonable legal and accounting fees, arising or resulting from your breach of this Agreement, any of Your Content that is uploaded, posted or otherwise transmitted to the Service using your account, or your other access, contribution to, use or misuse of the Service. Hirenetics shall provide notice to you of any such claim, suit or demand. Hirenetics reserves the right to assume the exclusive defense and control of any matter which is subject to indemnification under this section. In such case, you agree to cooperate with any reasonable requests assisting Hirenetics’s defense of such matter.</p>

                <p>10 Assignment. Hirenetics may assign or transfer this TOS, in whole or in part, without restriction.</p>

                <p>11 Governing Law. This TOS shall be governed by the laws of the State of California without regard to the principles of conflicts of law. You hereby expressly agree to submit to the exclusive personal jurisdiction of the federal and state courts of the State of California for the purpose of resolving any dispute relating to your access to or use of the Service.
                </p>

                <p>12 Privacy; DMCA. Please visit www.hirenetics.com/privacy_policy to understand how Hirenetics collects and uses personal information. The Digital Millennium Copyright Act of 1998 (the "DMCA") provides recourse for copyright owners who believe that material appearing on the Internet infringes their rights under U.S. copyright law. If you believe in good faith that any Content made available in connection with the Service infringes your copyright, you (or your agent) may send Hirenetics a notice requesting that the Content be removed, or access to it blocked. Notices and counter-notices must meet the then-current statutory requirements imposed by the DMCA (see http://www.loc.gov/copyright for details). Notices and counter notices with respect to the Service should be sent to Hirenetics at:<a href="mailto:info@hirenetics.com">info@hirenetics.com</a>.
                </p>
            </div>

        </div>

    </div>
    <!-- /.container -->

    <!-- footer goes here -->
    
');

insert into static_content (spath, scontent) values ('/employers', '

    <!-- header goes here -->
    

    <div id="myCarousel" class="carousel slide">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <div class="item active">
            <!-- <div class="item carousel-custom-background-image"> -->
                <div class="fill" style="background-image:url(''img/fish.jpg'');"></div>
                <div class="carousel-caption">
                    <h2 style="color:#00112b">Which candidate is right for you?</h2>
                </div>
            </div>
            
            <!--
            <div class="item carousel-custom-background-image">
                <div class="fill" style="background-image:url(''img/calm_ocean.jpg'');"></div>
                <div class="carousel-caption">
                    <h1>This one has a background image.</br>neat photo</h1>
                </div>
            </div>
            <div class="item carousel-custom-background-color">
                <div class="fill"></div>
                <div class="carousel-caption">
                    <h1>Better, Faster, Cheaper?</h1>
                    <p>need content</p>
                </div>
            </div>
            -->
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="icon-prev"></span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="icon-next"></span>
        </a>
    </div>

        
        <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <br>&nbsp;<br>
                    <h2>Find Your Ideal Candidates</h2>
                    <br>&nbsp;<br>
                    
                    <p><img src="/imgs/bullet40x37.png" style="padding-right:20px; vertical-align:middle; width:50px; height:auto;" /><big>List a Job: Our system will match talent in ranked order.  </big><br><br></p>
                    <p><img src="/imgs/bullet40x37.png" style="padding-right:20px; vertical-align:middle; width:50px; height:auto;" /><big>Interview Requests: Select top candidates to interview via email.</big><br><br></p>
                    <p><img src="/imgs/bullet40x37.png" style="padding-right:20px; vertical-align:middle; width:50px; height:auto;" /><big>Video: Request video pre-interviews with additional requirements. </big><br><br></p>
                    <p><img src="/imgs/bullet40x37.png" style="padding-right:20px; vertical-align:middle; width:50px; height:auto;" /><big>Use your dashboard to manage listings and hiring.</big><br><br></p>
                    <p><img src="/imgs/bullet40x37.png" style="padding-right:20px; vertical-align:middle; width:50px; height:auto;" /><big>Share with peers and social networks.</big><br><br></p>
                    
                    <h3>Pricing</h3>
                    <p>&nbsp;</p>

                    <p><img src="/imgs/bullet40x37.png" style="padding-right:20px; vertical-align:middle; width:50px; height:auto;" /><big>Special introductory price of $295/Listing!</big><br><br></p>

                    <p><img src="/imgs/bullet40x37.png" style="padding-right:20px; vertical-align:middle; width:50px; height:auto;" /><big>Pay a flat fee to list a job as long as it takes to locate the right candidate.</big><br><br></p>
                    <p><img src="/imgs/bullet40x37.png" style="padding-right:20px; vertical-align:middle; width:50px; height:auto;" /><big>Use video to pre-interview candidates quickly on specific skills, aptitude, and communication.</big><br><br></p>
                    
                    <h3>Bulk Pricing Discount</h3>
                    <p>&nbsp;</p>

                    <p><img src="/imgs/bullet40x37.png" style="padding-right:20px; vertical-align:middle; width:50px; height:auto;" /><big>Contact us for discounted pricing and start saving now.  </big><br><br></p>
                    <p><img src="/imgs/bullet40x37.png" style="padding-right:20px; vertical-align:middle; width:50px; height:auto;" /><big>Use video to pre-interview candidates quickly on specific skills, aptitude, and communication.</big><br><br></p>
                    
                    <h3>Test Your Team or Department</h3>
                    <p>&nbsp;</p>

                    <p><img src="/imgs/bullet40x37.png" style="padding-right:20px; vertical-align:middle; width:50px; height:auto;" /><big>Starting at $195</big><br><br></p>

                    <p><img src="/imgs/bullet40x37.png" style="padding-right:20px; vertical-align:middle; width:50px; height:auto;" /><big>Assess each department for cultural fit.  Contact us for pricing.</big><br><br></p>
                    <p><img src="/imgs/bullet40x37.png" style="padding-right:20px; vertical-align:middle; width:50px; height:auto;" /><big>Create an effective listing to produce better hires.</big><br><br></p>
                    <p><img src="/imgs/bullet40x37.png" style="padding-right:20px; vertical-align:middle; width:50px; height:auto;" /><big>Use your dashboard to manage listings and hiring.</big><br><br></p>

                    <h3><a href="">Click to Get Started</a></h3>
                    
                    <!-- need some padding -->
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>

                </div>
            </div>
            <!-- /.row -->

        </div>
        <!-- /.container -->

    
    
 <!-- footer here -->
');
