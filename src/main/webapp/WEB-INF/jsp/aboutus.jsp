<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="css/fontawesome/css/all.css">
    <link rel="stylesheet" href="css/default.css">
    <script src="js/bootstrap.bundle.js"></script>
    <title>About Us</title>
</head>

<body class=" align-items-center aboutus">
    <!--Main Page Header-->
    <div class="main-page-header mb-3">
        <!--Container-->
        <div class="container d-flex align-items-center">
            <!--Company name-->
            <div class="company-name">
                Cadmus Finance Corporation
            </div>
            <!--End of Company name-->

            <!--Navigation-->
            <nav class="navigation">
                <li><a href="/"><i class="fa-solid fa-house mx-2 my-2"></i>Home</a></li>
                <li><a href="/perk"><i class="fa-solid fa-hand-holding-heart fa-lg mx-2 my-3"></i>Perks</a></li>
                <li class="navbar-selected"><a href="aboutus.html"><i
                            class="fa-solid fa-users fa-lg mx-2 my-3"></i>About Us</a></li>
                <li><a href="/adminlogin"><i class="fa-solid fa-briefcase fa-lg mx-2 my-3"></i>Admin Login</a>
                </li>
            </nav>
            <!--End of Navigation-->
        </div>
        <!--End of Container-->
    </div>
    <!--End of Main Page Header-->

    <!-- Quote Card -->
    <!-- Card header -->
    <h1 id="about-us-header">ABOUT US</h1>
    <!--End of Card header -->
    <div class="card text-center bg-transparent border-0 quote">
        <!-- card body -->
        <div class="card-body">
            <!-- card title -->
            <div class="card-title">
                <i class="fa-solid fa-quote-left" style="position: relative;bottom: 30px;right: 25px;"></i>
                With a legacy of expertise and a dedication to innovation, we at Cadmus Financial Corporation
                are committed to giving our clients the best possible service and support.
                <i class="fa-solid fa-quote-right" style="position: relative;top: 30px;left: 25px;"></i>
            </div>
            <!-- End of card title -->
        </div>
        <!--End of Card body -->
    </div>
    <!--End of Quote Card -->

    <!-- Company Logo -->
    <a href="/"><img src="images/logos/3.png" height="62px" class="company-logo"></a>
    <!--End of Company Logo -->

    <!-- First panel -->
    <div class="panel">
        <!-- who we are section -->
        <div class="who">
            <div class="container d-flex justify-content-center">
                <!-- Mission card -->
                <div class="card text-center bg-transparent border-0" style="margin-right: 100px;">
                    <i class="fa-solid fa-rocket fa-4x"
                        style="position: relative; top: 70px;right: 28px;color: #243c5b;text-align: left;"></i>
                    <!-- card body -->
                    <div class="card-body">

                        <!-- card title -->
                        <div class="card-title" style="color: #243c5b">
                            Our Mission
                        </div>
                        <!-- End of card title -->
                        <!-- card text -->
                        <div class="card-text" style="color: #243c5b">
                            <p>Our mission is to be a responsible, efficient, and socially conscious bank that
                                positively
                                contributes to the communities in which we operate.</p>
                        </div>
                        <!--End of card text -->
                    </div>
                    <!--End of Card body -->
                </div>
                <!--End of Mission card -->

                <!-- Vision Card -->
                <div class="card text-center bg-transparent border-0">
                    <i class="fa-solid fa-bullseye fa-4x"
                        style="position: relative; top: 75px;right: 14px;color: #243c5b;text-align: left;"></i>
                    <!-- card body -->
                    <div class="card-body">
                        <!-- card title -->
                        <div class="card-title" style="color: #243c5b">
                            Our Vision
                        </div>
                        <!-- End of card title -->
                        <!-- card text -->
                        <div class="card-text" style="color: #243c5b">
                            To excel in customer delivery by using intelligence, empowering employees, and smart use of
                            technology in order to be the primary provider of financial solutions.
                        </div>
                        <!--End of card text -->
                    </div>
                    <!--End of Card body -->
                </div>
                <!--End of Vision Card -->
            </div>

            <div class="container d-flex justify-content-center">
                <!-- Values Card -->
                <div class="card text-center bg-transparent border-0">
                    <i class="fa-regular fa-gem fa-5x"
                        style="position: relative; top: 78px;right: 39px;color: #243c5b;text-align: left;"></i>
                    <!-- card body -->
                    <div class="card-body">
                        <!-- card title -->
                        <div class="card-title" style="color: #243c5b">
                            Our Core Values
                        </div>
                        <!-- End of card title -->
                        <!-- card text -->
                        <div class="card-text my-5 mx-5" style="color: #243c5b">
                            <div class="row">
                                <div class="col me-4 ms-4">
                                    <div><i class="fa-solid fa-crown fa-3x "></i></div>
                                    <i class="fa-solid fa-user-group fa-3x "></i>
                                    <p class="mt-2">Customer&nbsp;Oriented</p>
                                </div>
                                <div class="col me-5 ms-4">
                                    <i class="fa-solid fa-award fa-5x mt-2"></i>
                                    <p class="mt-2" style="position: relative; top: 10px;">Prowess</p>
                                </div>
                                <div class="col me-5 ms-4">
                                    <div><i class="fa-solid fa-scale-balanced fa-5x mt-2"></i></div>
                                    <p class="mt-2" style="position: relative; top: 10px;">Integrity</p>
                                </div>
                                <div class="col me-4 ms-3">
                                    <div><i class="fa-solid fa-magnifying-glass fa-6x mt-1"></i></div>
                                    <i class="fa-solid fa-eye fa-2x"
                                        style="position:relative; bottom: 80px; right: 10px;"></i>
                                    <p style="position: relative; bottom: 30px;">Transparency</p>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col me-5 ms-4">
                                    <div><i class="fa-solid fa-people-group fa-5x mt-2"></i></div>
                                    <p class="mt-2">Teamwork</p>
                                </div>
                                <div class="col me-4 ms-3">
                                    <div><i class="fa-solid fa-hand-fist fa-5x mt-2"></i></div>
                                    <p class="mt-2">Leadership</p>
                                </div>
                                <div class="col me-4 ms-3">
                                    <div><i class="fa-solid fa-file-shield fa-5x mt-2"></i></div>
                                    <p class="mt-2 me-3">Security</p>
                                </div>
                                <div class="col me-4 ms-3">
                                    <div><i class="fa-solid fa-hands-holding-circle fa-5x mt-2"></i></div>
                                    <p class="mt-2">Sustainability</p>
                                </div>
                            </div>

                        </div>
                        <!--End of card text -->
                    </div>
                    <!--End of Card body -->
                </div>
                <!--End of Values Card -->
            </div>
        </div>
        <!--End of who we are section -->
    </div>
    <!--End of First panel -->

    <!-- Second Panel -->
    <div class="panel">
        <div class="history">
            <!-- History card -->
            <div class="card text-center bg-transparent border-0 justify-content-center">
                <i class="fa-solid fa-scroll fa-5x"
                    style="position: relative; top: 70px;left: 10px;color: #804000;text-align: left;"></i>
                <!-- card body -->
                <div class="card-body px-5">
                    <!-- card title -->
                    <div class="card-title" style="color: #804000">
                        History
                    </div>
                    <!-- End of card title -->
                    <!-- card text -->
                    <div class="card-text" style="color: #804000">
                        <p>Cadmus Bank was established in 1955 in a small town in the Suburbs of Mumbai City. The
                            founders of the bank were a group of local businessmen who wanted to provide better
                            financial services to the residents of their community. The bank started as a small
                            operation with just a few employees and one branch location.</p>
                        <p>
                            In the early years, Cadmus Bank focused on providing basic banking services such as current
                            and savings accounts, loans, and mortgages. The bank's reputation for excellent customer
                            service and reasonable rates spread fast throughout the neighbourhood, and it began to draw
                            customers from nearby towns.
                        </p>
                        <p>
                            In the 1970s, the bank began to expand its operations by opening new branch locations in
                            nearby cities. In order to adapt to the evolving requirements of its customers, the bank
                            also provided new products and amenities such as credit cards and online banking.
                        </p>
                        <p>
                            By the 1980s, the bank had grown into a regional financial institution with dozens of
                            branch locations across several states. The bank maintained its focus on providing
                            personalised service and developing strong customer relationships.
                        </p>
                        <p>
                            Cadmus Bank weathered the financial crisis in the 1990s by taking a conservative approach to
                            lending and risk management. The bank recovered from the recession as one of the industry's
                            finest and most stable institutions.
                        </p>
                        <p>
                            Today, Cadmus Bank is a well-known financial institution with a reputation for offering
                            exceptional customer service and a commitment to serving the communities where it operates.
                            In a continuously changing financial landscape, the bank continues to innovate and develop
                            new services and goods to meet the growing needs of its consumers.
                        </p>
                    </div>
                    <!--End of card text -->
                </div>
                <!--End of Card body -->
            </div>
            <!--End of History card -->

            <!-- Timeline Card -->

            <div class="card text-center bg-transparent border-0 justify-content-center" style="margin: 0px -150px;">
                <i class="fa-solid fa-timeline fa-4x"
                    style="position: relative; top: 63px; left: 30px;color: #804000;text-align: left;"></i>
                <!-- card body -->
                <div class="card-body px-5 py-4">
                    <!-- card title -->
                    <div class="card-title mb-5" style="color: #804000">
                        Journey
                    </div>
                    <!-- End of card title -->
                    <!-- card text -->
                    <div class="card-text" style="color: #804000">
                        <!-- container -->
                        <div class="container">
                            <!-- row -->
                            <div class="row">
                                <!-- column -->
                                <div class="col">
                                    <!-- Timeline steps -->
                                    <div class="timeline-steps">
                                        <div class="timeline-step ms-2 me-5">
                                            <div class="timeline-content">
                                                <div class="inner-circle"></div>
                                                <p class="mt-4 mb-3 timeline-period">1955</p>
                                                <p>Cadmus Bank Established</p>
                                            </div>
                                        </div>

                                        <div class="timeline-step ms-2 me-5">
                                            <div class="timeline-content">
                                                <div class="inner-circle"></div>
                                                <p class="mt-4 mb-3 timeline-period">1960</p>
                                                <p>Embedded a Robust Reputation</p>
                                            </div>
                                        </div>

                                        <div class="timeline-step ms-2 me-5">
                                            <div class="timeline-content">
                                                <div class="inner-circle"></div>
                                                <p class="mt-4 mb-3 timeline-period">1970</p>
                                                <p style="width: 200px;position: relative; right: 23px;">
                                                    Inaugurated&nbsp;Additional&nbsp;Branch&nbsp;Offices</p>
                                            </div>
                                        </div>

                                        <div class="timeline-step  ms-2 me-5">
                                            <div class="timeline-content">
                                                <div class="inner-circle"></div>
                                                <p class="mt-4 mb-3 timeline-period">1980</p>
                                                <p style="width: 200px;position: relative; right: 16px;">
                                                    Formed&nbsp;a&nbsp;Regional Financial&nbsp;Institution</p>
                                            </div>
                                        </div>

                                        <div class="timeline-step ms-2 me-5">
                                            <div class="timeline-content">
                                                <div class="inner-circle"></div>
                                                <p class="mt-4 mb-3 timeline-period">1990</p>
                                                <p>Survived the Financial Crisis</p>
                                            </div>
                                        </div>

                                        <div class="timeline-step ms-2 me-5">
                                            <div class="timeline-content">
                                                <div class="inner-circle"></div>
                                                <p class="mt-4 mb-3 timeline-period">2000</p>
                                                <p>Ambitious towards new innovations</p>
                                            </div>
                                        </div>

                                    </div>
                                    <!-- Timeline steps -->
                                </div>
                                <!-- column -->
                            </div>
                            <!--End of row -->
                        </div>
                        <!--End of container -->
                    </div>
                    <!--End of card text -->
                </div>
                <!--End of Card body -->
            </div>
        </div>
    </div>
    <!-- End of Second Panel -->

    <!-- Third Panel -->
    <div class="panel">
        <div class="award">
            <!-- Award card -->
            <div class="card text-center bg-transparent border-0 justify-content-center">
                <i class="fa-solid fa-trophy fa-5x"
                    style="position: relative; top: 60px; left: 20px;color: #42512f;text-align: left;"></i>
                <!-- card body -->
                <div class="card-body px-5" id="award-card">
                    <!-- card title -->
                    <div class="card-title" style="color: #42512f">
                        Awards & Recognization
                    </div>
                    <!-- End of card title -->

                    <div class="container my-4">
                        <div class="row justify-content-center">
                            <div class="col-auto mb-4">
                                <div class="card bg-transparent border-0">
                                    <div class="card-body">
                                        <span style="position: relative;bottom: 7px;left: 185px;">April 25<sup>th</sup>
                                            , 1991</span>
                                        <h5 class="mt-3 mb-2">Winner</h5>
                                        <h1>Best Bank (Private Sector)</h1>
                                        <hr style="color: black; height: 3px;">
                                        <p>Cadmus Bank was named the Best Bank in the Private Sector by NDTV Profit
                                            Business.</p>
                                    </div>
                                </div>
                            </div>

                            <div class="col-auto mb-3">
                                <div class="card bg-transparent border-0">
                                    <div class="card-body">
                                        <span style="position: relative;bottom: 7px;left: 140px;">December
                                            18<sup>th</sup> , 1993</span>
                                        <h5 class="mt-3 mb-2">Winner</h5>
                                        <h1>Fastest Growing Bank</h1>
                                        <hr style="color: black; height: 3px;">
                                        <p>Cadmus Bank was awarded as the Fastest Growing Bank by Polaris Finance.</p>
                                    </div>
                                </div>
                            </div>

                            <div class="col-auto mb-3">
                                <div class="card bg-transparent border-0">
                                    <div class="card-body">
                                        <span style="position: relative;bottom: 7px;left: 195px;">July 04<sup>th</sup> ,
                                            1995</span>
                                        <h5 class="mt-3 mb-2">Bronze Medal</h5>
                                        <h1>Digital Marketing Excellence</h1>
                                        <hr style="color: black; height: 3px;">
                                        <p>Cadmus Bank won bronze medal for Digital Marketing at the Digix Virtual
                                            Summit</p>
                                    </div>
                                </div>
                            </div>

                            <div class="col-auto mb-3">
                                <div class="card bg-transparent border-0">
                                    <div class="card-body">
                                        <span style="position: relative;bottom: 7px;left: 135px;">November
                                            23<sup>rd</sup> , 1996</span>
                                        <h5 class="mt-3 mb-2">Runner Up</h5>
                                        <h1>Best Corporate Bank</h1>
                                        <hr style="color: black; height: 3px;">
                                        <p>Cadmus Bank was named Runner Up for Best Corporate Bank by Global Finance.
                                        </p>
                                    </div>
                                </div>
                            </div>

                            <div class="col-auto mb-3">
                                <div class="card bg-transparent border-0">
                                    <div class="card-body">
                                        <span style="position: relative;bottom: 7px;left: 185px;">May 22<sup>nd</sup> ,
                                            1999</span>
                                        <h5 class="mt-3 mb-2">Winner</h5>
                                        <h1>Consistent Performer</h1>
                                        <hr style="color: black; height: 3px;">
                                        <p>Cadmus Bank was awarded as Consistent Performer by Business Today & KPMG.</p>
                                    </div>
                                </div>
                            </div>

                            <div class="col-auto mb-3">
                                <div class="card bg-transparent border-0">
                                    <div class="card-body">
                                        <span style="position: relative;bottom: 7px;left: 165px;">August 17<sup>th</sup>
                                            , 2005</span>
                                        <h5 class="mt-3 mb-2">Runner Up</h5>
                                        <h1>Most Trusted Bank</h1>
                                        <hr style="color: black; height: 3px;">
                                        <p>Cadmus Bank was named Runner Up for Most Trusted Bank by Brand Equity Finance.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <!--End of Card body -->
            </div>
            <!--End of Award card -->
        </div>
    </div>
    <!--End of  Third Panel -->

    <!-- Forth Panel -->
    <div class="panel">
        <div class="bod">
            <!-- Board of directors card -->
            <div class="card text-center bg-transparent border-0 justify-content-center">
                <i class="fa-solid fa-people-roof fa-5x"
                    style="position: relative; top: 66px;left: 20px;color: #664d00;text-align: left;"></i>
                <!-- card body -->
                <div class="card-body px-5">
                    <!-- card title -->
                    <div class="card-title" style="color: #664d00">
                        Board of Directors
                    </div>
                    <!-- End of card title -->

                    <!--Accordian menu container-->
                    <div class="container my-4">
                        <!--Accordian menu-->
                        <div class="accordion accordion-flush" id="accordionFlushExample">
                            <!-- Chairmen -->
                            <div class="accordion-item" >
                                <h2 class="accordion-header" id="flush-headingOne">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                        data-bs-target="#flush-collapseOne" aria-expanded="false"
                                        aria-controls="flush-collapseOne">
                                        Chairmen of the Board
                                    </button>
                                </h2>
                                <div id="flush-collapseOne" class="accordion-collapse collapse"
                                    aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                                    <!-- accordion body -->
                                    <div class="accordion-body">
                                        <!-- container -->
                                        <div class="container">
                                            <!-- row -->
                                            <div class="row justify-content-center">

                                                <!-- col -->
                                                <div class="col-auto ms-5 me-5">
                                                    <!-- member card -->
                                                    <div class="card bg-transparent border-0" id="bod-card">
                                                        <!-- card body -->
                                                        <div class="card-body">
                                                            <img class="card-img-top" src="images\bod\chairman.jpg" alt="Card image cap">
                                                            <hr style="color: black; height: 3px;">
                                                            <div class="card-title" style="color: #664d00">Rajesh Patel</div>
                                                            <div class="card-text" style="color: hwb(45 0% 40%)">Chairman</div>
                                                        </div>
                                                        <!-- End of card body -->
                                                    </div>
                                                    <!--End of member card -->
                                                </div>
                                                <!-- End of col -->

                                                <!-- col -->
                                                <div class="col-auto me-5">
                                                    <!-- member card -->
                                                    <div class="card bg-transparent border-0" id="bod-card">
                                                        <!-- card body -->
                                                        <div class="card-body">
                                                            <img class="card-img-top" src="images\bod\vice_chairman.jpg" alt="Card image cap">
                                                            <hr style="color: black; height: 3px;">
                                                            <div class="card-title" style="color: #664d00">Priya Divekar</div>
                                                            <div class="card-text" style="color: hwb(45 0% 40%)">Vice Chairman</div>
                                                        </div>
                                                        <!-- card body -->
                                                    </div>
                                                    <!--End of member card -->
                                                </div>
                                                <!--End of col -->

                                                <!-- col -->
                                                <div class="col-auto">
                                                    <!-- member card -->
                                                    <div class="card bg-transparent border-0" id="bod-card">
                                                        <!-- card body -->
                                                        <div class="card-body">
                                                            <img class="card-img-top" src="images\bod\vice_chairman2.jpg" alt="Card image cap">
                                                            <hr style="color: black; height: 3px;">
                                                            <div class="card-title" style="color: #664d00">Deepak Mehta</div>
                                                            <div class="card-text" style="color: hwb(45 0% 40%)">Vice Chairman</div>
                                                        </div>
                                                        <!-- card body -->
                                                    </div>
                                                    <!--End of member card -->
                                                </div>
                                                <!--End of col -->

                                            </div>
                                            <!--End of row -->
                                        </div>
                                        <!--End of container -->
                                    </div>
                                    <!--End of accordion body -->
                                </div>
                            </div>
                            <!--End of Chairmen -->

                            <!-- Independent Directors -->
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="flush-headingTwo">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                        data-bs-target="#flush-collapseTwo" aria-expanded="false"
                                        aria-controls="flush-collapseTwo">
                                        Independent Directors
                                    </button>
                                </h2>
                                <div id="flush-collapseTwo" class="accordion-collapse collapse"
                                    aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
                                    <div class="accordion-body">
                                        <!-- container -->
                                        <div class="container">
                                            <!-- row -->
                                            <div class="row justify-content-center">

                                                <!-- col -->
                                                <div class="col-auto me-3 me-5">
                                                    <!-- member card -->
                                                    <div class="card bg-transparent border-0" id="bod-card">
                                                        <!-- card body -->
                                                        <div class="card-body">
                                                            <img class="card-img-top" src="images\bod\indie_director1.jpg" alt="Card image cap">
                                                            <hr style="color: black; height: 3px;">
                                                            <div class="card-title" style="color: #664d00">Anmol Gupta</div>
                                                            <div class="card-text" style="color: hwb(45 0% 40%)">Independent Director</div>
                                                        </div>
                                                        <!-- End of card body -->
                                                    </div>
                                                    <!--End of member card -->
                                                </div>
                                                <!-- End of col -->

                                                <!-- col -->
                                                <div class="col-auto me-5">
                                                    <!-- member card -->
                                                    <div class="card bg-transparent border-0" id="bod-card">
                                                        <!-- card body -->
                                                        <div class="card-body">
                                                            <img class="card-img-top" src="images/bod/indie_director2.jpg" alt="Card image cap">
                                                            <hr style="color: black; height: 3px;">
                                                            <div class="card-title" style="color: #664d00">Dhruv Kapoor</div>
                                                            <div class="card-text" style="color: hwb(45 0% 40%)">Independent Director</div>
                                                        </div>
                                                        <!-- card body -->
                                                    </div>
                                                    <!--End of member card -->
                                                </div>
                                                <!--End of col -->

                                                <!-- col -->
                                                <div class="col-auto me-5">
                                                    <!-- member card -->
                                                    <div class="card bg-transparent border-0" id="bod-card">
                                                        <!-- card body -->
                                                        <div class="card-body">
                                                            <img class="card-img-top" src="images/bod/indie_director3.jpg" alt="Card image cap">
                                                            <hr style="color: black; height: 3px;">
                                                            <div class="card-title" style="color: #664d00">Deepak Mehta</div>
                                                            <div class="card-text" style="color: hwb(45 0% 40%)">Independent Director</div>
                                                        </div>
                                                        <!-- card body -->
                                                    </div>
                                                    <!--End of member card -->
                                                </div>
                                                <!--End of col -->

                                                <!-- col -->
                                                <div class="col-auto me-3">
                                                    <!-- member card -->
                                                    <div class="card bg-transparent border-0" id="bod-card">
                                                        <!-- card body -->
                                                        <div class="card-body">
                                                            <img class="card-img-top" src="images/bod/indie_director4.jpg" alt="Card image cap">
                                                            <hr style="color: black; height: 3px;">
                                                            <div class="card-title" style="color: #664d00">Esha Sharma</div>
                                                            <div class="card-text" style="color: hwb(45 0% 40%)">Independent Director</div>
                                                        </div>
                                                        <!-- card body -->
                                                    </div>
                                                    <!--End of member card -->
                                                </div>
                                                <!--End of col -->

                                            </div>
                                            <!--End of row -->
                                        </div>
                                        <!--End of container -->
                                    </div>
                                </div>
                            </div>
                            <!-- Independent Directors -->

                            <!-- Executive Director -->
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="flush-headingThree">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                        data-bs-target="#flush-collapseThree" aria-expanded="false"
                                        aria-controls="flush-collapseThree">
                                        Executive Directors
                                    </button>
                                </h2>
                                <div id="flush-collapseThree" class="accordion-collapse collapse"
                                    aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
                                    <div class="accordion-body">
                                        <!-- container -->
                                        <div class="container">
                                            <!-- row -->
                                            <div class="row justify-content-center">

                                                <!-- col -->
                                                <div class="col-auto me-3 me-5">
                                                    <!-- member card -->
                                                    <div class="card bg-transparent border-0" id="bod-card">
                                                        <!-- card body -->
                                                        <div class="card-body">
                                                            <img class="card-img-top" src="images/bod/exec_director1.jpg" alt="Card image cap">
                                                            <hr style="color: black; height: 3px;">
                                                            <div class="card-title" style="color: #664d00">Bhavya Reddy</div>
                                                            <div class="card-text" style="color: hwb(45 0% 40%)">Executive Director</div>
                                                        </div>
                                                        <!-- End of card body -->
                                                    </div>
                                                    <!--End of member card -->
                                                </div>
                                                <!-- End of col -->

                                                <!-- col -->
                                                <div class="col-auto me-5">
                                                    <!-- member card -->
                                                    <div class="card bg-transparent border-0" id="bod-card">
                                                        <!-- card body -->
                                                        <div class="card-body">
                                                            <img class="card-img-top" src="images/bod/exec_director2.jpg" alt="Card image cap">
                                                            <hr style="color: black; height: 3px;">
                                                            <div class="card-title" style="color: #664d00">Ishita Desai</div>
                                                            <div class="card-text" style="color: hwb(45 0% 40%)">Executive Director</div>
                                                        </div>
                                                        <!-- card body -->
                                                    </div>
                                                    <!--End of member card -->
                                                </div>
                                                <!--End of col -->

                                                <!-- col -->
                                                <div class="col-auto me-5">
                                                    <!-- member card -->
                                                    <div class="card bg-transparent border-0" id="bod-card">
                                                        <!-- card body -->
                                                        <div class="card-body">
                                                            <img class="card-img-top" src="images/bod/exec_director3.jpg" alt="Card image cap">
                                                            <hr style="color: black; height: 3px;">
                                                            <div class="card-title" style="color: #664d00">Gaurav Singhania</div>
                                                            <div class="card-text" style="color: hwb(45 0% 40%)">Executive Director</div>
                                                        </div>
                                                        <!-- End of card body -->
                                                    </div>
                                                    <!--End of member card -->
                                                </div>
                                                <!-- End of col -->

                                                <!-- col -->
                                                <div class="col-auto me-3">
                                                    <!-- member card -->
                                                    <div class="card bg-transparent border-0" id="bod-card">
                                                        <!-- card body -->
                                                        <div class="card-body">
                                                            <img class="card-img-top" src="images/bod/exec_director4.jpg" alt="Card image cap">
                                                            <hr style="color: black; height: 3px;">
                                                            <div class="card-title" style="color: #664d00">Aryan Sharma</div>
                                                            <div class="card-text" style="color: hwb(45 0% 40%)">Executive Director</div>
                                                        </div>
                                                        <!-- End of card body -->
                                                    </div>
                                                    <!--End of member card -->
                                                </div>
                                                <!-- End of col -->

                                            </div>
                                            <!--End of row -->
                                        </div>
                                        <!--End of container -->
                                    </div>
                                </div>
                            </div>
                            <!--End of Executive Director -->

                            <!-- General Manager -->
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="flush-headingFour">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                        data-bs-target="#flush-collapseFour" aria-expanded="false"
                                        aria-controls="flush-collapseFour">
                                        General Managers
                                    </button>
                                </h2>
                                <div id="flush-collapseFour" class="accordion-collapse collapse"
                                    aria-labelledby="flush-headingFour" data-bs-parent="#accordionFlushExample">
                                    <div class="accordion-body">
                                        <!-- container -->
                                        <div class="container">
                                            <!-- row -->
                                            <div class="row justify-content-center">

                                                <!-- col -->
                                                <div class="col-auto ms-3 me-5">
                                                    <!-- member card -->
                                                    <div class="card bg-transparent border-0" id="bod-card">
                                                        <!-- card body -->
                                                        <div class="card-body">
                                                            <img class="card-img-top" src="images/bod/manager1.jpg" alt="Card image cap">
                                                            <hr style="color: black; height: 3px;">
                                                            <div class="card-title" style="color: #664d00">Aishwarya Nair</div>
                                                            <div class="card-text" style="color: hwb(45 0% 40%)">Manager</div>
                                                        </div>
                                                        <!-- End of card body -->
                                                    </div>
                                                    <!--End of member card -->
                                                </div>
                                                <!-- End of col -->

                                                <!-- col -->
                                                <div class="col-auto me-5">
                                                    <!-- member card -->
                                                    <div class="card bg-transparent border-0" id="bod-card">
                                                        <!-- card body -->
                                                        <div class="card-body">
                                                            <img class="card-img-top" src="images/bod/manager2.jpg" alt="Card image cap">
                                                            <hr style="color: black; height: 3px;">
                                                            <div class="card-title" style="color: #664d00">Aisha Banerjee</div>
                                                            <div class="card-text" style="color: hwb(45 0% 40%)">Manager</div>
                                                        </div>
                                                        <!-- End of card body -->
                                                    </div>
                                                    <!--End of member card -->
                                                </div>
                                                <!-- End of col -->

                                                <!-- col -->
                                                <div class="col-auto me-5">
                                                    <!-- member card -->
                                                    <div class="card bg-transparent border-0" id="bod-card">
                                                        <!-- card body -->
                                                        <div class="card-body">
                                                            <img class="card-img-top" src="images/bod/manager3.jpg" alt="Card image cap">
                                                            <hr style="color: black; height: 3px;">
                                                            <div class="card-title" style="color: #664d00">Niharika Das</div>
                                                            <div class="card-text" style="color: hwb(45 0% 40%)">Manager</div>
                                                        </div>
                                                        <!-- End of card body -->
                                                    </div>
                                                    <!--End of member card -->
                                                </div>
                                                <!-- End of col -->

                                                <!-- col -->
                                                <div class="col-auto me-3">
                                                    <!-- member card -->
                                                    <div class="card bg-transparent border-0" id="bod-card">
                                                        <!-- card body -->
                                                        <div class="card-body">
                                                            <img class="card-img-top" src="images/bod/manager4.jpg" alt="Card image cap">
                                                            <hr style="color: black; height: 3px;">
                                                            <div class="card-title" style="color: #664d00">Mansi Rao</div>
                                                            <div class="card-text" style="color: hwb(45 0% 40%)">Manager</div>
                                                        </div>
                                                        <!-- End of card body -->
                                                    </div>
                                                    <!--End of member card -->
                                                </div>
                                                <!-- End of col -->

                                            </div>
                                            <!--End of row -->
                                        </div>
                                        <!--End of container -->
                                    </div>
                                </div>
                            </div>
                            <!--End of General Manager -->

                            <!-- Secretary -->
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="flush-headingFive">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                        data-bs-target="#flush-collapseFive" aria-expanded="false"
                                        aria-controls="flush-collapseFive">
                                        Secretary
                                    </button>
                                </h2>
                                <div id="flush-collapseFive" class="accordion-collapse collapse"
                                    aria-labelledby="flush-headingFive" data-bs-parent="#accordionFlushExample">
                                    <div class="accordion-body" style="border-bottom: solid 2px #806000;">
                                        <!-- container -->
                                        <div class="container">
                                            <!-- row -->
                                            <div class="row justify-content-center">

                                                <!-- col -->
                                                <div class="col-auto ms-3 me-5">
                                                    <!-- member card -->
                                                    <div class="card bg-transparent border-0" id="bod-card">
                                                        <!-- card body -->
                                                        <div class="card-body">
                                                            <img class="card-img-top" src="images/bod/secretary1.jpg" alt="Card image cap">
                                                            <hr style="color: black; height: 3px;">
                                                            <div class="card-title" style="color: #664d00">Mohit Khanna</div>
                                                            <div class="card-text" style="color: hwb(45 0% 40%)">Secretary</div>
                                                        </div>
                                                        <!-- End of card body -->
                                                    </div>
                                                    <!--End of member card -->
                                                </div>
                                                <!-- End of col -->

                                                <!-- col -->
                                                <div class="col-auto me-5">
                                                    <!-- member card -->
                                                    <div class="card bg-transparent border-0" id="bod-card">
                                                        <!-- card body -->
                                                        <div class="card-body">
                                                            <img class="card-img-top" src="images/bod/secretary2.jpg" alt="Card image cap">
                                                            <hr style="color: black; height: 3px;">
                                                            <div class="card-title" style="color: #664d00">Jignesh Shah</div>
                                                            <div class="card-text" style="color: hwb(45 0% 40%)">Secretary</div>
                                                        </div>
                                                        <!-- End of card body -->
                                                    </div>
                                                    <!--End of member card -->
                                                </div>
                                                <!-- End of col -->

                                                <!-- col -->
                                                <div class="col-auto me-5">
                                                    <!-- member card -->
                                                    <div class="card bg-transparent border-0" id="bod-card">
                                                        <!-- card body -->
                                                        <div class="card-body">
                                                            <img class="card-img-top" src="images/bod/secretary3.jpg" alt="Card image cap">
                                                            <hr style="color: black; height: 3px;">
                                                            <div class="card-title" style="color: #664d00">Karthik Menon</div>
                                                            <div class="card-text" style="color: hwb(45 0% 40%)">Secretary</div>
                                                        </div>
                                                        <!-- End of card body -->
                                                    </div>
                                                    <!--End of member card -->
                                                </div>
                                                <!-- End of col -->

                                                <!-- col -->
                                                <div class="col-auto me-3">
                                                    <!-- member card -->
                                                    <div class="card bg-transparent border-0" id="bod-card">
                                                        <!-- card body -->
                                                        <div class="card-body">
                                                            <img class="card-img-top" src="images/bod/secretary4.jpg" alt="Card image cap">
                                                            <hr style="color: black; height: 3px;">
                                                            <div class="card-title" style="color: #664d00">Kavya Kapadia</div>
                                                            <div class="card-text" style="color: hwb(45 0% 40%)">Secretary</div>
                                                        </div>
                                                        <!-- End of card body -->
                                                    </div>
                                                    <!--End of member card -->
                                                </div>
                                                <!-- End of col -->

                                            </div>
                                            <!--End of row -->
                                        </div>
                                        <!--End of container -->
                                    </div>
                                </div>
                            </div>
                            <!--End of Secretary -->

                        </div>
                        <!--End of Accordian menu-->
                    </div>
                    <!--End of Accordian menu container-->

                </div>
                <!--End of Card body -->
            </div>
            <!--End of Board of directors card -->
        </div>
    </div>
    <!--End of Forth Panel -->
</body>

</html>