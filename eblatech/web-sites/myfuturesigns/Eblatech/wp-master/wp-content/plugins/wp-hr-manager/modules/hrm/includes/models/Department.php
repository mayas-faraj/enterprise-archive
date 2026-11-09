<?php
namespace WPHR\HR_MANAGER\HRM\Models;

use WPHR\HR_MANAGER\Framework\Model;

/**
 * Class Department
 *
 * @package WPHR\HR_MANAGER\HRM\Models
 */
class Department extends Model {
	protected $primaryKey = 'id';
    protected $table = 'wphr_hr_depts';
    protected $fillable = [ 'title', 'description', 'lead', 'parent', 'status' ];
}
