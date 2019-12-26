<?php
/**
 * A class that contains code to handle any requests for  /profile/
 */
     namespace Pages;

     use \Support\Context as Context;
     use \Config\Config as Config;
/**
 * Support /profile/
 */
    class Profile extends \Framework\Siteaction
    {
/**
 * Handle profile operations
 *
 * @param object	$context	The context object for the site
 *
 * @return string	A template name
 */
        public function handle(Context $context)
        {
            // Retrieves current user bean
            $userid = $context->rest();
            $user = \R::load('user', $userid[0]);
            $context->local()->addVal('user', $user);

            // Retrieves upload beans from current user and group by group_id (remove duplicate uploads)
            $uploads = \R::findAll('upload', 'user_id = ? order by module_id', [$user->id]);
            $result = array();
            $id = -1;
            foreach ($uploads as $upl)
            {
                $oldid = $id;
                $id = $upl->group_id;

                if ($id != $oldid)
                {
                    array_push($result, $upl);
                }
            }
            $context->local()->addval('uploads', $result);

            // Creates array of modules and removes duplicates
            $result = array();
            $id = -1;
            foreach ($uploads as $upl)
            {
                $oldid = $id;
                $id = $upl->module_id;

                if ($id != $oldid)
                {
                    array_push($result, \R::load('module', $id));
                }
            }

            // Pass modules to twig file
            $context->local()->addval('modules', $result);

            // Retrieves form data
            $fdt = $context->formdata();
            $formid = $fdt->post('formid');
            switch ($formid)
            {
                // Save edits to user
                case 1: $id = $this->saveChanges($context);
                    $context->local()->addVal('user', \R::load('user', $id));
                    break;
                default: break;
            }

            $this->initLeaderboard($context);

            return '@content/profile.twig';
        }

/**
 * Save changes to user
 *
 * @param \Support\Context    $context  The context object
 *
 * @return int                $id       ID of user bean
 */
        public function saveChanges(Context $context): int
        {
            $user = \R::load('user', $context->user()->id);
            $fdt = $context->formdata();
            $user->bio = $fdt->mustpost('bio');
            $id = \R::store($user);
            return $id;
        }

/**
 * Arrange leaderboard
 *
 * @param \Support\Context    $context  The context object
 */
        public function initLeaderboard(Context $context)
        {
            $users = \R::findAll('user');

            // Goes through each upload and counts how many uploads each user has submitted
            foreach ($users as $user)
            {
                $user->upl_count = \R::count('upload', ' user_id = ?', [$user->id]);
                \R::store($user);
            }

            $context->local()->addVal('leaderboard', \R::findAll('user', ' order by upl_count'));
        }
    }
?>