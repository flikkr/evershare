<?php
/**
 * A class that contains code to handle any requests for  /uploadnotes/
 */
     namespace Pages;

     use \Support\Context as Context;
     use \Config\Config as Config;
/**
 * Support /uploadnotes/
 */
    class Uploadnotes extends \Framework\Siteaction
    {
/**
 * Handle uploadnotes operations
 *
 * @param object	$context	The context object for the site
 *
 * @return string	A template name
 */
        public function handle(Context $context)
        {
            $success = false;

            $fdt = $context->formdata();
            if ($fdt->hasfile('uploads'))
            {
                // Generated random id to help group notes in the same upload
                $rnd = \R::count('upload', '', []) * rand(1,100) * rand(1,100) * 23;

                if (Config::UPUBLIC && Config::UPRIVATE)
                { # need to check the flag could be either private or public
                    foreach ($fdt->posta('public') as $ix => $public)
                    {
                        $upl = \R::dispense('upload');
                        $upl->title = $fdt->mustpost('title');
                        $upl->description = $fdt->mustpost('descr');
                        $upl->module = $context->load('module', $fdt->mustpost('module'));
                        $upl->groupID = $rnd;
                        if (!$upl->correctType($context, $fdt->filedata('uploads', $ix)))
                        {
                            $context->local()->message(\Framework\Local::ERROR, 'Wrong file type uploaded');
                            break;
                        }
                        $success = $upl->savefile($context, $fdt->filedata('uploads', $ix), $public, $context->user(), $ix);
                    }
                }
                else
                {
                    foreach(new \Framework\FAIterator('uploads') as $ix => $fa)
                    { # we only support private or public in this case so there is no flag
                        $upl = \R::dispense('upload');
                        $upl->title = $fdt->mustpost('title');
                        $upl->description = $fdt->mustpost('descr');
                        $upl->module = $context->load('module', $fdt->mustpost('module'));
                        $upl->groupID = $rnd;
                        if (!$upl->correctType($context, $fa))
                        {
                            $context->local()->message(\Framework\Local::ERROR, 'Wrong file type uploaded');
                            break;
                        }
                        $success = $upl->savefile($context, $fa, Config::UPUBLIC, $context->user(), $ix);
                    }
                }

                // If successful upload, go to note page
                if ($success)
                {
                    $context->local()->message(\Framework\Local::MESSAGE, 'Upload successful');
                    $context->local()->addVal('url', $context->local()->base()."/note/$rnd/");
                }
            }

            // If no upload or unsuccessful, don't return url to note
            if (!$success)
            {
                $context->local()->addVal('url', '-1');
            }

            return '@content/uploadnotes.twig';
        }
    }
?>