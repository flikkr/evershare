<?php
/**
 * A class that contains code to handle any requests for  /browse/
 */
     namespace Pages;

     use \Support\Context as Context;
     use \Config\Config as Config;
     use \R as R;
/**
 * Support /browse/
 */
    class Browse extends \Framework\Siteaction
    {
/**
 * Handle browse operations
 *
 * @param object	$context	The context object for the site
 *
 * @return string	A template name
 */
        public function handle(Context $context)
        {
            $fdt = $context->formdata();
            $formid = $fdt->post('formid');

            if ($formid != 1)
            {
                $formid = $fdt->get('formid');
            }

            $context->local()->addval('hasCourse', 'false');

            switch ($formid)
            {
                case 1: $this->addModule($context);
                    break;
                case 2: $course = R::load('course', $fdt->mustget('courseID'));
                    $context->local()->addval('course', $course);
                    $context->local()->addval('hasCourse', 'true');
                    break;
                default: break;
            }

            return '@content/browse.twig';
        }

/**
 * Add a new module to database
 *
 * @see Framework\Ajax::bean 
 *
 * @param \Support\Context    $context  The context object
 *
 * @return \RedBeanPHP\OODBBean
 */
        public function addModule(Context $context) : bool
        {
            $fdt = $context->formdata();
            $mod = R::dispense('module');

            $id = $fdt->mustpost('courseID');
            $mod->course = $context->load('course', $id);

            $code = strtoupper($fdt->mustpost('code'));
            $mod->code = $code;

            $mod->name = $fdt->mustpost('name');
            R::store($mod);

            \Support\Context::getinstance()->local()->message(\Framework\Local::MESSAGE, 'Module added');
            return TRUE;
        }
    }
?>