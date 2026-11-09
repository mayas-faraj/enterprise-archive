<div class="note-tab-wrap wphr-grid-container">
    <h3><?php _e( 'Notes', 'wphr' ) ?></h3>

    <form action="" class="note-form row" method="post">
        <?php wphr_html_form_input( array(
            'name'        => 'note',
            'required'    => true,
            'placeholder' => __( 'Add a note...', 'wphr' ),
            'type'        => 'textarea',
            'custom_attr' => array( 'rows' => 3, 'cols' => 30 )
        ) ); ?>

        <input type="hidden" name="user_id" value="<?php echo $employee->id; ?>">
        <input type="hidden" name="action" id="wphr-employee-action" value="wphr-hr-employee-new-note">

        <?php wp_nonce_field( 'wp-wphr-hr-employee-nonce' ); ?>
        <?php submit_button( __( 'Add Note', 'wphr' ), 'primary' ); ?>
        <span class="wphr-loader wphr-note-loader"></span>
    </form>

    <?php
    $no_of_notes = 10;
    $total_notes = $employee->count_notes();
    $notes = $employee->get_notes( $no_of_notes );

    if ( $notes ) {
        ?>
        <ul class="wphr-list notes-list">
            <?php foreach( $notes as $note ) { ?>
            <li>
                <div class="avatar-wrap">
                    <?php echo get_avatar( $note->user->user_email, 64 ); ?>
                </div>

                <div class="note-wrap">
                    <div class="by">
                        <a href="#" class="author"><?php echo $note->user->display_name; ?></a>
                        <span class="date"><?php echo wphr_format_date( $note->created_at, __( 'M j, Y \a\t g:i a', 'wphr' ) ); ?></span>
                    </div>

                    <div class="note-body">
                        <?php echo wpautop( $note->comment ); ?>
                    </div>
                    <?php if( current_user_can( 'manage_options' ) OR (wp_get_current_user()->ID == $note->comment_by ) ) { ?>
                        <div class="row-action">
                            <span class="delete"><a href="#" class="delete_note" data-note_id="<?php echo $note->id; ?>"><?php _e( 'Delete', 'wphr' ); ?></a></span>
                        </div>
                    <?php } ?>
                </div>
            </li>
            <?php } ?>
        </ul>



    <?php } ?>
     <?php  $display_class =  ( $no_of_notes < $total_notes ) ? 'show':'hide' ; ?>
    <div class="wpwphr-load-more-btn <?php echo $display_class?>">
            <?php submit_button( 'Load More', false, 'wphr-load-notes', true, array( 'id' => 'wphr-load-notes', 'data-total_no' => $total_notes, 'data-offset_no' => $no_of_notes, 'data-user_id' => $employee->id ) ); ?>
    </div>

</div>
