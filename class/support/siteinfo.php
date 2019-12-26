<?php

/**
 * A class that contains code to return info needed in various places on the site
 *
 * @author Lindsay Marshall <lindsay.marshall@ncl.ac.uk>
 * @copyright 2016-2018 Newcastle University
 *
 */

namespace Support;

/**
 * Utility class that returns generally useful information about parts of the site
 * The parent class (FWSiteInfo) contains a set of functions that are used by the
 * admin pages of the site.
 */
class SiteInfo extends \Framework\SiteInfo
{
    /**
     * Get all courses from database
     *
     * @param int       $start      Start position - used for pagination
     * @param int       $count      The number to be fetched - used for pagination
     * @param string    $order      An order clause
     * @param bool      $collect    If TRUE then use collect not fetch
     *
     * @return array
     */
    public function courses(int $start = -1, int $count = -1, string $order = '', bool $collect = FALSE): array
    {
        return $this->{$collect ? 'collect' : 'fetch'}('course', $order !== '' ? $order : ' order by name', [], $start, $count);
    }
    
    /**
     * Get all modules from database
     *
     * @param int       $start      Start position - used for pagination
     * @param int       $count      The number to be fetched - used for pagination
     * @param string    $order      An order clause
     * @param bool      $collect    If TRUE then use collect not fetch
     *
     * @return array
     */
    public function modules(int $start = -1, int $count = -1, string $order = '', bool $collect = FALSE): array
    {
        return $this->{$collect ? 'collect' : 'fetch'}('module', $order !== '' ? $order : ' order by code', [], $start, $count);
    }

    /**
     * Get all uploads from database
     *
     * @param int       $start      Start position - used for pagination
     * @param int       $count      The number to be fetched - used for pagination
     * @param string    $order      An order clause
     * @param bool      $collect    If TRUE then use collect not fetch
     *
     * @return array
     */
    public function uploads(int $start = -1, int $count = -1, string $order = '', bool $collect = FALSE): array
    {
        return $this->{$collect ? 'collect' : 'fetch'}('upload', $order !== '' ? $order : ' order by name', [], $start, $count);
    }

    /**
     * Get all uploads from given user id
     *
     * @param int       $userid     Id of the user for which we are retrieving uploads
     * @param int       $start      Start position - used for pagination
     * @param int       $count      The number to be fetched - used for pagination
     * @param string    $order      An order clause
     * @param bool      $collect    If TRUE then use collect not fetch
     *
     * @return array
     */
    public function uploadGroup(int $group_id, int $user_id): array
    {
        return \R::findAll('upload', ' user_id = :user_id and group_id = :group_id', [':group_id' => $group_id, ':user_id' => $user_id]);
    }

    /**
     * Get a single bean
     *
     * @param string    $bean           Name of bean
     * @param int       $id             Bean id
     *
     * @return ?\RedBeanPHP\OODBBean    Bean object
     */
    public function getBean(string $bean, int $id): ?\RedBeanPHP\OODBBean
    {
        return \R::load($bean, $id);
    }

    /**
     * Count number of beans of given type
     *
     * @param string    $bean           Name of bean
     *
     * @return int                      Count
     */
    public function getCount(string $bean, string $where, array $params = []): int
    {
        return \R::count($bean, $where, $params);
    }

    /**
     * Get all modules for which a user uploaded
     *
     * @param int       $userid     Id of the user for which we are retrieving uploads
     * @param int       $start      Start position - used for pagination
     * @param int       $count      The number to be fetched - used for pagination
     * @param string    $order      An order clause
     * @param bool      $collect    If TRUE then use collect not fetch
     *
     * @return array
     */
    public function uploadsPerModule(int $module_id, int $start = -1, int $count = -1, bool $collect = FALSE): array
    {
        $temp = $this->{$collect ? 'collect' : 'fetch'}('upload', 'module_id = :module_id order by title', [':module_id' => $module_id], $start, $count);
        $result = array();
        $id = -1;

        // Remove duplicates
        foreach ($temp as $bean)
        {
            $oldid = $id;
            $id = $bean->group_id;

            if ($id != $oldid)
            {
                array_push($result, $bean);
            }
        }

        return $result;
    }

    /**
     * Get all the modules from a given course
     *
     * @param int       $start      Start position - used for pagination
     * @param int       $count      The number to be fetched - used for pagination
     * @param string    $order      An order clause
     * @param bool      $collect    If TRUE then use collect not fetch
     *
     * @return array
     */
    public function modulesPerCourse(int $courseID, int $start = -1, int $count = -1, string $order = '', bool $collect = FALSE): array
    {
        return $this->{$collect ? 'collect' : 'fetch'}('module', 'course_id = :course_id', [':course_id' => $courseID], $start, $count);
    }
}
