<?php
/**
 * A class that contains code to handle any requests for  /module/
 */
     namespace Pages;

     use \Support\Context as Context;
     use \Config\Config as Config;
     use \R as R;
/**
 * Support /module/
 */

    class Module extends \Framework\Siteaction
    {
        
/**
 * Handle module operations
 *
 * @param object	$context	The context object for the site
 *
 * @return string	A template name
 */
        public function handle(Context $context)
        {
            $modid = $context->rest();
            $mod = R::load('module', $modid[0]);
            $context->local()->addval('mod', $mod);

            $upload = R::findAll('upload', 'module_id = :module_id', [':module_id' => $mod->id]);
            $context->local()->addval('upl', $upload);

            return '@content/module.twig';
        }
    }
?>