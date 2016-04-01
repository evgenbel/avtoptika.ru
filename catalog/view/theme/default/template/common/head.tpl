<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title><?php echo $title; ?></title>
    <?php if ($keywords) { ?>
        <meta name="keywords" content="<?php echo $keywords; ?>" />
    <?php } ?>
    <?php if ($description) { ?>
        <meta name="description" content="<?php echo $description; ?>" />
    <?php } ?>
    <?php if ($icon) { ?>
        <link href="<?php echo $icon; ?>" rel="shortcut icon" type="image/x-icon" />
    <?php } ?>

    <meta property="og:title" content="Performance Optimizing for Smart Layers" />
    <meta property="og:type" content="blog" />
    <meta property="og:image" content="<?php echo '/image/' . $this->config->get('config_banner'); ?>" />
    <meta property="og:url" content="http://www.addthis.com/blog/2013/09/17/performance-optimizing-for-smart-layers/" />
    <meta property="og:site_name" content="AddThis Blog" />

    <link rel="stylesheet" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/style.css" type="text/css" media="screen, projection" />
    <link rel="stylesheet" href="catalog/view/theme/default/stylesheet/popup<?=$mobile?"_mobile":""?>.css" type="text/css" media="screen, projection" />
    <link rel="stylesheet" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/jquery.fancybox.css" type="text/css" media="screen, projection" />
    <link rel="stylesheet" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/reviews.css" type="text/css" media="screen, projection" />
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:700&subset=latin,cyrillic"  type="text/css" />
    <script src="http://code.jquery.com/jquery-1.8.0.min.js" type="text/javascript"></script>
    <script src="catalog/view/javascript/bxSlider.js" type="text/javascript"></script>
    <script type="text/javascript" src="catalog/view/javascript/inputmask.js"></script>
    <script src="catalog/view/javascript/main.js" type="text/javascript"></script>
    <script src="catalog/view/javascript/jquery.fancybox.js" type="text/javascript"></script>
    <script src="catalog/view/javascript/jquery.form.js" type="text/javascript"></script>

    <link rel="stylesheet" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/jquery.countdown.css" />
    <script src="catalog/view/javascript/jquery.countdown.js"></script>
    <script>
        var hour=<?php echo $hour;?>;
        var min=<?php echo $min;?>;
        var sec=<?php echo $sec;?>;

        $(document).ready(function(){
            //var timerId = setInterval(changeTime,1000);

            $('#countdown').countdown({
                timestamp	:  (new Date).getTime()+<?php echo $tm*1000?>
            });
        });

    </script>
    <?=$google_analytics;?>
</head>