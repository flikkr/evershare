<?php
/**
 * A class that contains code to handle any requests for  /note/
 */
     namespace Pages;

     use \Support\Context as Context;
     use \Config\Config as Config;
/**
 * Support /note/
 */
    class Note extends \Framework\Siteaction
    {
/**
 * Handle note operations
 *
 * @param object	$context	The context object for the site
 *
 * @return string	A template name
 */
        public function handle(Context $context)
        {
            // Retrieves form data
            $fdt = $context->formdata();
            $formid = $fdt->post('formid');

            // Allows access to individual attributes of upload
            $uplid = $context->rest();
            $upl = \R::findOne('upload', ' group_id = ? ', [$uplid[0]]);

            switch ($formid)
            {
                // Save edits to upload
                case 1: $this->saveChanges($context, $upl->group_id);
                    break;
                // Delete uploads from the same group
                case 2: $this->delUpload($context, $upl->group_id);
                    return '@content/browse.twig';
                default: break;
            }

            // Refresh (fresh() did not work)
            $upl = \R::findOne('upload', ' group_id = ? ', [$uplid[0]]);
            $context->local()->addval('upload', $upl);

            // Allows access to date
            $split = explode(' ', $upl->added);
            $context->local()->addval('added', $split[0]);

            return '@content/note.twig';
        }

/**
 * Save changes to upload
 *
 * @param \Support\Context    $context  The context object
 *
 * @return \RedBeanPHP\OODBBean
 */
        public function saveChanges(Context $context, int $group_id)
        {
            $fdt = $context->formdata();
            $uploads = \R::findAll('upload', ' group_id = ?', [$group_id]);

            // Check that there are new files to upload
            // if ($fdt->hasfile('uploads'))
            // {
            //     if (Config::UPUBLIC && Config::UPRIVATE)
            //     { # need to check the flag could be either private or public
            //         foreach ($fdt->posta('public') as $ix => $public)
            //         {
            //             $upl = \R::dispense('upload');
            //             $group_id = $upl->group_id;
            //             $upl->title = $fdt->mustpost('title');
            //             $upl->description = $fdt->mustpost('descr');
            //             $upl->module = $context->load('module', $fdt->mustpost('module'));
            //             $upl->groupID = $group_id;
            //             if (!$upl->correctType($context, $fdt->filedata('uploads', $ix)))
            //             {
            //                 return;
            //             }
            //             $upl->savefile($context, $fdt->filedata('uploads', $ix), $public, $context->user(), $ix);
            //         }
            //     }
            //     else
            //     {
            //         foreach(new \Framework\FAIterator('uploads') as $ix => $fa)
            //         { # we only support private or public in this case so there is no flag
            //             $upl = \R::dispense('upload');
            //             $group_id = $upl->group_id;
            //             $upl->title = $fdt->mustpost('title');
            //             $upl->description = $fdt->mustpost('descr');
            //             $upl->module = $context->load('module', $fdt->mustpost('module'));
            //             $upl->groupID = $group_id;
            //             if (!$upl->correctType($context, $fa))
            //             {
            //                 return;
            //             }
            //             $upl->savefile($context, $fa, Config::UPUBLIC, $context->user(), $ix);
            //         }
            //     }
            //    
            //     // Remove old uploads
            //     \R::trashAll($uploads);
            // }

            // If there aren't, just update text attributes
            foreach ($uploads as $upl)
            {
                $upl->module_id = $fdt->mustpost('module');
                $upl->title = $fdt->mustpost('title');
                $upl->description = $fdt->mustpost('descr');

                \R::store($upl);
            }
        }

/**
 * Save changes to upload
 *
 * @param \Support\Context    $context  The context object
 *
 * @return \RedBeanPHP\OODBBean
 */
        public function delUpload(Context $context, int $group_id)
        {
            $todel = \R::findAll('upload', 'group_id = ?', [$group_id]);
            \R::trashAll($todel);
        }
    }
?>