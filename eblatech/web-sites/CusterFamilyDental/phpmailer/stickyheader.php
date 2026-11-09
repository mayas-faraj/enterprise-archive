<!-- sticky header section starts here-->
<header class="stuck up hidden-xs hidden-sm">
  <div class="">
    <div class="row">
      <div class="col-md-4"><a href="index.php?menu=home" class="brand"><img src="images/CusterFamilyDental_Logo-01-Sticky.png" alt="logo"></a></div>
      <div class="col-md-8">
        <ul class="main-menu">
                <li class="home"><a href="home" class="btn-default">Home</a>
                </li>
                <li class="about"><a href="index.php?menu=about#aboutus" class="btn-default">About Us<i class="fa fa-angle-down hidden-sm hidden-md hidden-lg"></i></a>
                </li>
                <li class="meet"><a href="index.php?menu=meet#meetus" class="btn-default">Meet Us<i class="fa fa-angle-down hidden-sm hidden-md hidden-lg"></i></a>
                </li>
                <li class="tech"><a href="index.php?menu=tech#technology" class="btn-default">Technology<i class="fa fa-angle-down hidden-sm hidden-md hidden-lg"></i></a>
                </li>
                 <li class="general"><a href="general-dentistry" class="btn-default">General Dentistry<i class="fa fa-angle-down hidden-sm hidden-md hidden-lg"></i></a>
                </li>
                 <li class="ortho"><a href="ortho" class="btn-default">Ortho<i class="fa fa-angle-down hidden-sm hidden-md hidden-lg"></i></a>
                </li>
                 <li class="kids"><a href="kids" class="btn-default">Kids<i class="fa fa-angle-down hidden-sm hidden-md hidden-lg"></i></a>
                <li class="Visit"><a href="kids.php?menu=Visit" class="btn-default">New Patient<i class="fa fa-angle-down hidden-sm hidden-md hidden-lg"></i></a>
                </li>
                <li class="contact"><a href="index.php?menu=contact#contact-us" class="btn-default">Schedule Now </a>
                </li>
			
        </ul>
      </div>
    </div>
  </div>
</header>
<!-- sticky header section ends here-->

<button onclick="topFunction()" id="myBtn" title="Go to top"><i class="fa fa-chevron-up" aria-hidden="true"></i></button>
    <style>
    #myBtn {
    display: none; /* Hidden by default */
    position: fixed; /* Fixed/sticky position */
    bottom: 20px; /* Place the button at the bottom of the page */
    right: 30px; /* Place the button 30px from the right */
    z-index: 99; /* Make sure it does not overlap */
    border: none; /* Remove borders */
    outline: none; /* Remove outline */
    background-color: cadetblue; /* Set a background color */
    color: white; /* Text color */
    cursor: pointer; /* Add a mouse pointer on hover */
    padding: 15px; /* Some padding */
    border-radius: 10px; /* Rounded corners */
}

#myBtn:hover {
    background-color: #555; /* Add a dark-grey background on hover */
}
    </style>
    
    <script>// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
    if (document.body.scrollTop > 50 || document.documentElement.scrollTop > 50) {
        document.getElementById("myBtn").style.display = "block";
    } else {
        document.getElementById("myBtn").style.display = "none";
    }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
    document.body.scrollTop = 0; // For Chrome, Safari and Opera 
    document.documentElement.scrollTop = 0; // For IE and Firefox
}</script>