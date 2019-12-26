<?php
/**
 * You can put arbitrary code in here and run it
 */
foreach(\R::findAll('module') as $m)
{
    $m->sharedCourse[] = $m->course;
    \R::store($m);
}
    \Support\Context::getinstance()->local()->message(\Framework\Local::MESSAGE, 'Done');
?>
