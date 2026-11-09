<div class="permission-tab-wrap">
    <h3><?php 
_e( 'Permission Management', 'wphr' );
?>
</h3>

    <form action="" class="permission-form wphr-form" method="post">

        <?php 
$is_manager = ( user_can( $employee->id, wphr_hr_get_manager_role() ) ? 'on' : 'off' );
$is_receive_mail_for_leaves = $is_manage_leave_of_employees = 'on';
$class = 'manager_services ';

if ( $is_manager == 'on' ) {
    $is_receive_mail_for_leaves = get_user_meta( $employee->id, 'receive_mail_for_leaves', true );
    $is_manage_leave_of_employees = get_user_meta( $employee->id, 'manage_leave_of_employees', true );
    $is_receive_mail_for_leaves = ( $is_receive_mail_for_leaves ? 'on' : 'off' );
    $is_manage_leave_of_employees = ( $is_manage_leave_of_employees ? 'on' : 'off' );
} else {
    $class .= 'hide';
}

wphr_html_form_input( array(
    'label' => __( 'HR Manager', 'wphr' ),
    'name'  => 'enable_manager',
    'type'  => 'checkbox',
    'tag'   => 'div',
    'value' => $is_manager,
    'help'  => __( 'This Employee is HR Manager', 'wphr' ),
) );
wphr_html_form_input( array(
    'label'         => __( 'Receive E-mail Notification', 'wphr' ),
    'name'          => 'receive_mail_for_leaves',
    'type'          => 'checkbox',
    'tag'           => 'div',
    'wrapper_class' => $class,
    'value'         => $is_receive_mail_for_leaves,
    'help'          => __( 'If it is checked then this HR manager will receive email notification when any employee post leave request.', 'wphr' ),
) );
wphr_html_form_input( array(
    'label'         => __( 'Manage Leave', 'wphr' ),
    'name'          => 'manage_leave_of_employees',
    'type'          => 'checkbox',
    'tag'           => 'div',
    'wrapper_class' => $class,
    'value'         => $is_manage_leave_of_employees,
    'help'          => __( 'If it is checked then this HR manager can able to view and manage leave requests of all employees', 'wphr' ),
) );
?>


        <?php 
do_action( 'wphr_hr_permission_management', $employee );
?>

        <input type="hidden" name="employee_id" value="<?php 
echo  $employee->id ;
?>
">
        <input type="hidden" name="wphr-action" id="wphr-employee-action" value="wphr-hr-employee-permission">
		
        <?php 
wp_nonce_field( 'wp-wphr-hr-employee-permission-nonce' );
?>
        <?php 
submit_button( __( 'Update Permission', 'wphr' ), 'primary' );
?>
    </form>

</div>
