<?php

/** Callbacks *****************************/

function wphr_hr_dashboard_widget_birthday_callback() {
    wphr_admin_dash_metabox( __( '<i class="fa fa-birthday-cake"></i> Birthday Buddies', 'wphr' ), 'wphr_hr_dashboard_widget_birthday' );
    wphr_admin_dash_metabox( __( '<i class="fa fa-paper-plane"></i> Who is out', 'wphr' ), 'wphr_hr_dashboard_widget_whoisout' );
}

function wphr_hr_dashboard_widget_announcement_callback() {
    wphr_admin_dash_metabox( __( '<i class="fa fa-microphone"></i> Latest Announcement', 'wphr' ), 'wphr_hr_dashboard_widget_latest_announcement' );
    wphr_admin_dash_metabox( __( '<i class="fa fa-calendar-o"></i> My Leave Calendar', 'wphr' ), 'wphr_hr_dashboard_widget_leave_calendar' );
}


add_action( 'wphr_hr_dashboard_widgets_right', 'wphr_hr_dashboard_widget_birthday_callback' );
add_action( 'wphr_hr_dashboard_widgets_left', 'wphr_hr_dashboard_widget_announcement_callback' );

/** Widgets *****************************/

/**
 * Birthday widget
 *
 * @return void
 */
function wphr_hr_dashboard_widget_birthday() {
    $todays_birthday  = wphr_hr_get_todays_birthday();
    $upcoming_birtday = wphr_hr_get_next_seven_days_birthday();
    ?>
    <?php if ( $todays_birthday ) { ?>

        <h4><?php _e( 'Today\'s Birthday', 'wphr' ); ?></h4>

        <ul class="wphr-list list-inline">
            <?php
            foreach ( $todays_birthday as $key => $user ) {
                $employee = new \WPHR\HR_MANAGER\HRM\Employee( intval( $user->user_id ) );
                ?>
                <li><a href="<?php echo $employee->get_details_url(); ?>" class="wphr-tips" title="<?php echo $employee->get_full_name(); ?>"><?php echo $employee->get_avatar( 32 ); ?></a></li>
            <?php } ?>
        </ul>

        <?php
    }
    ?>

    <?php if ( $upcoming_birtday ) { ?>

        <h4><?php _e( 'Upcoming Birthdays', 'wphr' ); ?></h4>

        <ul class="wphr-list list-two-side list-sep">

            <?php foreach ( $upcoming_birtday as $key => $user ): ?>

                <?php $employee = new \WPHR\HR_MANAGER\HRM\Employee( intval( $user->user_id ) ); ?>

                <li>
                    <a href="<?php echo $employee->get_details_url(); ?>"><?php echo $employee->get_full_name(); ?></a>
                    <span><?php echo wphr_format_date( $user->date_of_birth, 'M, d' ); ?></span>
                </li>

            <?php endforeach; ?>

        </ul>
        <?php
    }

    if ( ! $todays_birthday && ! $upcoming_birtday ) {
        _e( 'No one has birthdays this week!', 'wphr' );
    }
}

/**
 * Latest Announcement Widget
 *
 * @since 0.1
 *
 * @return void
 */
function wphr_hr_dashboard_widget_latest_announcement() {

    //if user is admin then show latest 5 announcements
    if ( current_user_can( wphr_hr_get_manager_role() ) ) {
        $query = new WP_Query( array(
            'post_type'      => 'wphr_hr_announcement',
            'posts_per_page' => '5',
            'order'          => 'DESC'
        ) );
        $announcements = $query->get_posts();
    } else {
        $announcements = wphr_hr_employee_dashboard_announcement( get_current_user_id() );
    }

    if ( $announcements ) {
    ?>
    <ul class="wphr-list wphr-dashboard-announcement">
        <?php
        $i = 0;
        foreach ( $announcements as $key => $announcement ): ?>
            <li class="<?php echo ($announcement->status !== 'read') ? 'unread' : 'read'; ?>">
                <div class="announcement-title">
                    <a href="#" <?php echo ( $announcement->status == 'read' ) ? 'class="read"' : ''; ?>>
                        <?php echo $announcement->post_title; ?>
                    </a> | <span class="announcement-date"><?php echo wphr_format_date( $announcement->post_date ); ?></span>
                </div >

                <?php echo ( 0 == $i ) ? '<p>' . wp_trim_words( $announcement->post_content, 50 ) . '</p>' : ''; ?>

                <div class="announcement-row-actions">
                    <?php if ( ! current_user_can( wphr_hr_get_manager_role() ) ): ?>
                        <a href="#" class="mark-read wphr-tips <?php echo ( $announcement->status == 'read' ) ? 'wphr-hide' : ''; ?>" title="<?php _e( 'Mark as Read', 'wphr' ); ?>" data-row_id="<?php echo $announcement->id; ?>"><i class="dashicons dashicons-yes"></i></a>
                    <?php endif; ?>
                    <a href="#" class="view-full wphr-tips" title="<?php _e( 'View full announcement', 'wphr' ); ?>" data-row_id="<?php echo $announcement->ID; ?>"><i class="dashicons dashicons-editor-expand"></i></a>
                </div>
            </li>
        <?php $i++;
        endforeach ?>
    </ul>
    <?php
    } else {
        _e( 'No announcement found', 'wphr' );
    }
}

/**
 * wphr dashboard who is out widget
 *
 * @since 0.1
 *
 * @return void
 */
function wphr_hr_dashboard_widget_whoisout() {
    $leave_requests           = wphr_hr_get_current_month_leave_list();
    $leave_requests_nextmonth = wphr_hr_get_next_month_leave_list();
    ?>
    <?php if ( $leave_requests ) { ?>

        <h4><?php _e( 'This Month', 'wphr' ); ?></h4>

        <ul class="wphr-list list-two-side list-sep">
            <?php foreach ( $leave_requests as $key => $leave ): ?>
                <?php $employee = new \WPHR\HR_MANAGER\HRM\Employee( intval( $leave->user_id ) ); ?>
                <li>
                    <a href="<?php echo $employee->get_details_url(); ?>"><?php echo $employee->get_full_name(); ?></a>
                    <span><i class="fa fa-calendar"></i> <?php echo wphr_format_date( $leave->start_date, 'M d' ) . ' - '. wphr_format_date( $leave->end_date, 'M d' ); ?></span>
                </li>
            <?php endforeach ?>
        </ul>
    <?php } ?>

    <?php if ( $leave_requests_nextmonth ) { ?>
        <h4><?php _e( 'Next Month', 'wphr' ); ?></h4>

        <ul class="wphr-list list-two-side list-sep">
            <?php foreach ( $leave_requests_nextmonth as $key => $leave ): ?>
                <?php $employee = new \WPHR\HR_MANAGER\HRM\Employee( intval( $leave->user_id ) ); ?>
                <li>
                    <a href="<?php echo $employee->get_details_url(); ?>"><?php echo $employee->get_full_name(); ?></a>
                    <span><i class="fa fa-calendar"></i> <?php echo wphr_format_date( $leave->start_date, 'M d' ) . ' - '. wphr_format_date( $leave->end_date, 'M d' ); ?></span>
                </li>
            <?php endforeach ?>
        </ul>

    <?php } ?>

    <?php if ( ! $leave_requests && ! $leave_requests_nextmonth ) { ?>

        <?php _e( 'No one is on vacation on this or next month', 'wphr' ); ?>

    <?php } ?>

    <?php
}

/**
 * wphr dashboard leave calendar widget
 *
 * @since 0.1
 *
 * @return void
 */
function wphr_hr_dashboard_widget_leave_calendar() {

    $user_id        = get_current_user_id();

    $leave_requests = wphr_hr_get_calendar_leave_events( false, $user_id, false );
    
    $holidays       = wphr_array_to_object( \WPHR\HR_MANAGER\HRM\Models\Leave_Holiday::select('*')->where( 'location_id' , 0 )->get()->toArray() );

    $location_id = \WPHR\HR_MANAGER\HRM\Models\Employee::select('location')->where( 'user_id' , $user_id )->get()->toArray();
    
	if( count( $location_id ) ){
    	$location_id = $location_id[0]['location'];
	}else{
		$location_id = 0;
	}

	/*
    $country_val = WPHR\HR_MANAGER\Admin\Models\Company_Locations::select('country')->from('wp_wphr_company_locations')->where('id',$location_id)->get()->toArray();
    if( count( $country_val ) ){
        $country_val = $country_val[0]['country'];
    }else{
    	$country_val = '';
    }*/

    $leave_requests = wphr_hr_get_calendar_leave_events( false, $user_id, false );
    if( $location_id ){
	    $holidays_byLocation       = wphr_array_to_object( \WPHR\HR_MANAGER\HRM\Models\Leave_Holiday::select('*')->where( 'location_id' , $location_id )->get()->toArray() );
	}
    $events         = [];
    $holiday_events = [];
    $event_data     = [];


    // To Get holidays list By Location as well as global
    if(!empty($holidays_byLocation))
    {
        $holidays = array_merge( $holidays, $holidays_byLocation );
    }
    
    foreach ( $leave_requests as $key => $leave_request ) {
        //if status pending
        $policy = wphr_hr_leave_get_policy( $leave_request->policy_id );
        $event_label = $policy->name;
        if ( 2 == $leave_request->status ) {
            $policy = wphr_hr_leave_get_policy( $leave_request->policy_id );
            $event_label .= sprintf( ' ( %s ) ', __( 'Pending', 'wphr' ) );
        }
        $events[] = array(
            'id'        => $leave_request->id,
            'title'     => $event_label,
            'start'     => $leave_request->start_date,
            'end'       => $leave_request->end_date,
            'url'       => wphr_hr_url_single_employee( $leave_request->user_id, 'leave' ),
            'color'     => $leave_request->color,
        );
    }

    foreach ( $holidays as $key => $holiday ) {
        $holiday_events[] = [
            'id'        => $holiday->id,
            'title'     => $holiday->title,
            'start'     => $holiday->start,
            'end'       => $holiday->end,
            'color'     => '#FF5354',
            'img'       => '',
            'holiday'   => true
        ];
    }

    $event_data = array_merge( $events, $holiday_events );
	?>
    <style>
        .fc-time {
            display:none;
        }
        .wphr-leave-avatar img {
            border-radius: 50%;
            margin: 3px 7px 0 0;

        }
        .wphr-calendar-filter {
            margin: 15px 0px;
        }
        .fc-title {
            position: relative;
        }
    </style>

    <?php if ( wphr_hr_get_assign_policy_from_entitlement( $user_id ) ): ?>
        <div class="wphr-hr-new-leave-request-wrap">
            <a href="#" class="button button-primary" id="wphr-hr-new-leave-req"><?php _e( 'Take a Leave', 'wphr' ); ?></a>
        </div>
    <?php endif ?>

    <div id="wphr-hr-calendar"></div>

    <script>
    ;jQuery(document).ready(function($) {

        $('#wphr-hr-calendar').fullCalendar({
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },
            editable: false,
            eventLimit: true,
            events: <?php echo json_encode( $event_data ); ?>,
            eventRender: function(event, element, calEvent) {
                if ( event.holiday ) {
                    element.find('.fc-content').find('.fc-title').css({ 'top':'0px', 'left' : '3px', 'fontSize' : '13px', 'padding':'2px' });
                };
            },
        });
    });

    </script>
    <?php
}

/**
 * Employee list url
 *
 * @since  1.1.10
 *
 * @return  string
 */
function wphr_hr_employee_list_url() {
    $args = [
        'page' => 'wphr-hr-employee'
    ];

    $url = add_query_arg( $args, admin_url( 'admin.php' ) );
    $url = apply_filters( 'wphr_hr_employee_list_url', $url, $args );

    return $url;
}



