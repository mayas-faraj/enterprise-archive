<script>
    
        <div id="fb-root"></div>
<script>(function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/ar_AR/sdk.js#xfbml=1&version=v2.4";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
</script>
<!--=======content================================-->

<section id="content">
    <div class="full-width-container block-1">
        <div class="container">
            <div class="row">
                <div class="grid_12">
                    <header>
                        <h2>
                            <span>
                                <?php
                                if (isset($title_page)) {
                                    echo $title_page[0]['title_page'];
                                }
                                ?>

                            </span>

                        </h2>
                    </header>
                </div>
            </div>
            <div class="row">
                <div class="grid_12">
                    <?php
                    if (isset($data_cat) && !empty($data_cat)) {
                        for ($i = 0; $i < count($data_cat); $i++) {
                            ?>

                            <article class="clearfix">
                                <div class="grid_4 alpha">
                                    <div class="img_container"><img src="thumb_photo/<?= $data_cat[$i]['prod_img_1']; ?>" alt="<?= $data_cat[$i]['prod_img_1']; ?>"></div>
                                </div>
                                <div class="grid_4">
                                    <h5>
                                        <a href="index.php?details=<?= ($data_cat[$i]['id']) . "&lang=" . $data_lang->getName() ?>"><?= $data_cat[$i]['title']; ?></a>
                                       <div class="fb-share-button" data-href="http://perfectmission.net/index.php?details=<?= ($data_cat[$i]['id'])?>&amp;lang=<?=$data_lang->getName()?>" data-layout="button_count"></div>
                                        </h5>
                                    <p><?= $data_cat[$i]['small_text']; ?></p>
                                </div>
                                <div class="grid_4">
                                    <h5 class="h5__mod"><a href="#"><?= $LANG_USFUL_LINKS; ?></a></h5>
                                    <ul>
                                        <?php
                                        if (!empty($data_cat[$i]['links']))
                                            $links = explode(",", $data_cat[$i]['links']);
                                        for ($j = 0; $j < count($links); $j++) {
                                            echo ' <li><a href="' . $links[$j] . '">' . $links[$j] . '</a></li>';
                                        }
                                        ?>
                                    </ul>
                                </div>
                            </article>
                            <?php
                        }
                    }
                    ?>
                </div>

            </div>
        </div>
    </div>
</section>
