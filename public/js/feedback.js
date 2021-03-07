// //even handler
// $(document).on('submit', '#form-data-dslkjdkskddsjd', function(e){
//     e.preventDefault();
//     $('.pp-loading-typography').show();
//     $('.pp-error-message').empty();
//     $('#form-data-dslkjdkskddsjd textarea').prop('readonly', true);
//     $('#form-data-dslkjdkskddsjd button').prop('disabled', true);

//     var formData = new FormData(this);
//     formData.delete('attachments[]');
//     jQuery.each(jQuery('#attachments')[0].files, function(i, file) {
//         formData.append('attachments['+i+']', file);
//     });

//     // var formData = new FormData(this);
//     $.ajax({
//         dataType: 'JSON',
//         type: 'POST',
//         data: formData,
//         processData: false,
//         contentType: false,
//         url: '/api/v1/feedback',
//         headers: {
//             'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
//         },
//         success: function(res){
//             $('.pp-loading-typography').hide();
//             $('#form-data-dslkjdkskddsjd textarea').prop('readonly', false);
//             $('#form-data-dslkjdkskddsjd button').prop('disabled', false);
//             $('#message-kjkjsdsd').val('');
//             $('#attachments').val('');

//             if(res.status != 'error'){
//                 $('#ms-core').append(`<div class="alert alert-success" role="alert">Thank you :), Your feedback has been sent</div>`);
//                 setTimeout(function(){
//                     $('#ms-core').empty();
//                 }, 4000);
//             }else{
//                 $.each(res.errors, function(index, value){
//                     if (index == 'message'){
//                         $('#ms-message').append(`<span>${value}</span>`);
//                     }

//                     if(index == 'reporter'){
//                         $('#ms-core').append(`<div class="alert alert-danger" role="alert">${value}</div>`);
//                     }

//                     if(index == 'url'){
//                         $('#ms-url').append(`<span>${value}</span>`);
//                     }

//                     if(index == 'token'){
//                         $('#ms-core').append(`<div class="alert alert-danger" role="alert">${value}</div>`);
//                     }

//                     if(index.substring(0, 11) == 'attachments'){
//                         $('#ms-attachment').append(`<span>${value}</span><br>`);
//                     }
//                 });
//             }    
//         },
//         error:function(xmlhttprequest, textstatus, message) {
//             if(textstatus == 'timeout'){
//                 $('#ms-core').append(`<div class="alert alert-danger" role="alert">Check your internet connection</div>`);
//             }else{
//                 $('#ms-core').append(`<div class="alert alert-danger" role="alert">${message}</div>`);
//             }
//             $('.pp-loading-typography').hide();
//             $('#form-data-dslkjdkskddsjd textarea').prop('readonly', false);
//             $('#form-data-dslkjdkskddsjd button').prop('disabled', false);
//         }
//     });
// });

// $(document).on('keyup', '.form-control', function(){
//     $('.pp-error-message').empty();
// });

// $(document).ready(function(){
//     var $floaty = $('.floaty');

//     $floaty.on('mouseover click', function(e) {
//         $floaty.addClass('is-active');
//         e.stopPropagation();
//     });

//     $floaty.on('mouseout', function() {
//         $floaty.removeClass('is-active');
//     });

//     $('.container-feedback').on('click', function() {
//         $floaty.removeClass('is-active');
//     });

//     $('#floating-btn-feedback').on('click', function(){
//         $('#popup-feedback').modal('show');
//     });
// });

// class WidgetFeedback{
//     reporter;
//     randomize = this.makeid(6);
//     url;
//     token;
//     id = 'widget-'+ this.randomize
//     bootstrap_enabled = (typeof $().modal == 'function');
//     icon;

//     constructor(data) {
//         this.reporter = data.reporter;
//         this.url = data.url;
//         this.token = data.token;
//         this.icon = data.icon;

//         $('body').append(`<div id="${this.id}"></div>`);
//         this.id =  '#' + this.id;
//         this.drawCss();
//         this.drawFormFeedback();
//         this.drawFloatButton();
//     }

//     drawFormFeedback(){
//         if (this.bootstrap_enabled){
//             $(this.id).append(`
//                 <div class="modal fade" id="popup-feedback" data-backdrop="static" data-keyboard="false" role="dialog" aria-labelledby="feedback-popup-label" aria-hidden="true">
//                     <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
//                         <div class="modal-content">
//                             <div class="modal-header">
//                                 <h5 class="modal-title" id="feedback-popup-label">Send Your Feedback Here</h5>
//                                 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
//                                     <span aria-hidden="true">&times;</span>
//                                 </button>
//                             </div>
//                             <form id="form-data-dslkjdkskddsjd">
//                                 <div id="ms-core" class="pp-error-message"></div>
//                                 <div class="form-group">
//                                     <label for="url"><b>Url</b></label>
//                                     <input type="text" id="url-${this.randomize}" name="url" class="form-control" readonly>
//                                     <div id="ms-url" class="pp-error-message"></div>
//                                 </div>

//                                 <div class="form-group">
//                                     <label for="message"><b>Description</b></label>
//                                     <textarea type="email" name="message" id="message-kjkjsdsd" class="form-control" ></textarea>
//                                     <div id="ms-message" class="pp-error-message"></div>
//                                 </div>

//                                 <div class="form-group">
//                                     <label for="attachments"><b>Attachments </b>(optional, max 5 Mb for each attachment)</label><br>
//                                     <input type="file" id="attachments" name="attachments[]" class="pp-form-control" multiple>
//                                     <div id="ms-attachment" class="pp-error-message"></div>
//                                 </div>

//                                 <input type="hidden" name="reporter" id="reporter-${this.randomize}">
//                                 <input type="hidden" name="token" id="token-${this.randomize}"><br>

//                                 <button id="btn-feedback" type="submit" class="btn btn-success">Send</button> 
//                                 <div class="pp-loading-typography">
//                                     <span>Please Wait...</span>
//                                 </div>
//                             </form>
//                         </div>
//                     </div>
//                 </div>  
//             `);
//         }else{
//             $(this.id).append(`
//                 <div id="popup-feedback" class="pp-overlay">
//                     <div class="pp-popup">
//                         <h2>Send Your Feedback Here</h2>
//                         <a class="pp-close" href="#">&times;</a>
//                         <br>
//                         <div id="ms-core" class="pp-error-message"></div>
//                         <div class="pp-content">
//                             <form id="form-data-dslkjdkskddsjd">
//                                 <div class="form-group">
//                                     <label for="url"><b>Url</b></label>
//                                     <input type="text" id="url-${this.randomize}" name="url" class="form-control" readonly>
//                                     <div id="ms-url" class="pp-error-message"></div>
//                                 </div>

//                                 <div class="form-group">
//                                     <label for="message"><b>Description</b></label>
//                                     <textarea type="email" name="message" id="message-kjkjsdsd" class="form-control" ></textarea>
//                                     <div id="ms-message" class="pp-error-message"></div>
//                                 </div>

//                                 <div class="form-group">
//                                     <label for="attachments"><b>Attachments </b>(optional, max 5 Mb for each attachment)</label><br>
//                                     <input type="file" id="attachments" name="attachments[]" class="pp-form-control" multiple>
//                                     <div id="ms-attachment" class="pp-error-message"></div>
//                                 </div>

//                                 <input type="hidden" name="reporter" id="reporter-${this.randomize}">
//                                 <input type="hidden" name="token" id="token-${this.randomize}"><br>

//                                 <button id="btn-feedback" type="submit" class="btn btn-success">Send</button> 
//                                 <div class="pp-loading-typography">
//                                     <span>Please Wait...</span>
//                                 </div>
//                             </form>
//                         </div>
//                     </div>
//                 </div>
//             `);
//         }
        
//         $('#url-'+ this.randomize).val(this.url);
//         $('#reporter-'+ this.randomize).val(this.reporter);
//         $('#token-'+ this.randomize).val(this.token);
//         $('.pp-loading-typography').hide();
//     }

//     drawFloatButton(){
//         $(this.id).append(`
//             <div class="container-feedback">
//                 <div class="floaty">
//                 <ul class="floaty-list">
//                     <!--<li class="floaty-list-item">
//                     <span class="floaty-list-item-label">Barack (whitehouse.gov)</span>
//                     <img src="https://goo.gl/N5Fuxq" alt="" />
//                     </li>
//                     <li class="floaty-list-item">
//                     <span class="floaty-list-item-label">George (hotmail.com)</span>
//                     <img src="https://goo.gl/F5yGOp" alt="" />
//                     </li>
//                     <li class="floaty-list-item">
//                     <span class="floaty-list-item-label">Bill (gmail.com)</span>
//                     <img src="https://goo.gl/uWJOjS" alt="" />
//                     </li>
//                     <li class="floaty-list-item floaty-list-item--blue">
//                     <span class="floaty-list-item-label">Reminder</span>
//                     <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" class="absolute-center">
//                         <path d="M0 0h24v24h-24z" fill="none"/>
//                         <path d="M22 5.72l-4.6-3.86-1.29 1.53 4.6 3.86 1.29-1.53zm-14.12-2.33l-1.28-1.53-4.6 3.85 1.29 1.53 4.59-3.85zm4.62 4.61h-1.5v6l4.75 2.85.75-1.23-4-2.37v-5.25zm-.5-4c-4.97 0-9 4.03-9 9s4.02 9 9 9c4.97 0 9-4.03 9-9s-4.03-9-9-9zm0 16c-3.87 0-7-3.13-7-7s3.13-7 7-7 7 3.13 7 7-3.13 7-7 7z"/>
//                     </svg>
//                     </li>
//                     <li class="floaty-list-item floaty-list-item--yellow">
//                     <span class="floaty-list-item-label">Report bug</span>
//                     <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" class="absolute-center">
//                         <path d="M19 3h-14.01c-1.1 0-1.98.9-1.98 2l-.01 14c0 1.1.89 2 1.99 2h14.01c1.1 0 2-.9 2-2v-14c0-1.1-.9-2-2-2zm0 12h-4c0 1.66-1.34 3-3 3s-3-1.34-3-3h-4.01v-10h14.01v10zm-3-5h-2v-3h-4v3h-2l4 4 4-4z"/>
//                         <path d="M0 0h24v24h-24z" fill="none"/>
//                     </svg>
//                     </li>-->
//                 </ul>
//                 ${ this.bootstrap_enabled ? `<a id="floating-btn-feedback" href="#">` :  `<a href="#popup-feedback">`}  
//                     <div class="floaty-btn">
//                         <span class="floaty-btn-label">
//                             Send Feedback
//                         </span>
//                         <img class="floaty-btn-icon-plus" src="${ this.icon }" height="30" width="30" style="margin-top: 14px; margin-left:14px"></img>
//                         <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" class="floaty-btn-icon floaty-btn-icon-create absolute-center">
//                             <path d="M3 17.25v3.75h3.75l11.06-11.06-3.75-3.75-11.06 11.06zm17.71-10.21c.39-.39.39-1.02 0-1.41l-2.34-2.34c-.39-.39-1.02-.39-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z" fill="#fff"/>
//                             <path d="M0 0h24v24h-24z" fill="none"/>
//                         </svg>
//                     </div>
//                 </a>    
//                 </div>
//             </div>
//         `);
//     }

//     makeid(length) {
//         var result  = '';
//         var characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
//         var charactersLength = characters.length;
//         for ( var i = 0; i < length; i++ ) {
//            result += characters.charAt(Math.floor(Math.random() * charactersLength));
//         }
//         return result;
//     }

//     drawCss(){
//         $(this.id).append(`
//             <style>
//                 #form-data-dslkjdkskddsjd{
//                     padding:20px;
//                 }

//                 .pp-error-message span{
//                     font-size:11;
//                     margin:0;
//                     color:red;
//                 }

//                 /* loading */
//                 @keyframes sweep {
//                     0% {
//                         opacity: 0;
//                         transform: translate(0%, -50%);
//                     }
                
//                     1% {
//                         opacity: 1;
//                         transform: translate(0%, -50%);
//                     }
                
//                     5% {
//                         opacity: 1;
//                         transform: translate(0%, -50%);
//                     }
                
//                     40% {
//                         opacity: 1;
//                         transform: translate(100%, -50%);
//                     }
                
//                     41% {
//                         opacity: 0;
//                         transform: translate(100%, -50%);
//                     }
                
//                     100% {
//                         opacity: 0;
//                         transform: translate(0%, -50%);
//                     }
//                 }
                
//                 @keyframes fog {
//                     0% {
//                         opacity: 0;
//                     }
//                     45% {
//                         opacity: 1;
//                     }
//                     65% {
//                         opacity: 1;
//                     }
//                     100% {
//                         opacity: 0;
//                     }
//                 }
                
//                 .pp-loading-typography {
//                     position: relative;
//                     display: inline-block;
//                     margin: 0 auto;
//                     overflow: hidden;
//                     width: 100%;
//                     text-align: center;
//                     color: #a2a2a2;
//                     font-size: 12px;
//                     font-family: 'Muli', 'Century Gothic', sans-serif;
//                 }
                
//                 .pp-loading-typography span {
//                     animation: fog 2500ms infinite;
//                 }
                
//                 .pp-loading-typography::after {
//                     content: '';
//                     position: absolute;
//                     z-index: 2;
//                     display: block;
//                     padding-bottom: 25%;
//                     width: 125%;
//                     left: 0;
//                     top: 50%;
//                     background: linear-gradient(
//                         90deg,
//                         rgba(255, 255, 255, 0.9) 0%,
//                         rgba(255, 255, 255, 1) 37.5%,
//                         rgba(255, 255, 255, 1) 100%
//                     );
//                     border-radius: 100px;
//                     animation: sweep 2500ms infinite;
//                     animation-timing-function: cubic-bezier(0.42, 0.56, 0.62, 0.54);
//                     transform: translate(0, -50%);
//                 }
                
//                 .popup-feedback{
//                     z-index: 10000;
//                 }

//                 /* pop up */
//                 /*
//                 .pp-overlay {
//                     position: fixed;
//                     z-index: 10000;
//                     top: 0;
//                     bottom: 0;
//                     left: 0;
//                     right: 0;
//                     background: rgba(0, 0, 0, 0.7);
//                     transition: opacity 500ms;
//                     visibility: hidden;
//                     opacity: 0;
//                 }

//                 .pp-overlay:target {
//                     visibility: visible;
//                     opacity: 1;
//                 }

//                 .pp-popup {
//                     margin: 70px auto;
//                     padding: 20px;
//                     background: #fff;
//                     border-radius: 5px;
//                     width: 40%;
//                     position: relative;
//                     transition: all 5s ease-in-out;
//                 }

//                 .pp-popup h2 {
//                     margin-top: 0;
//                     color: #333;
//                     font-family: Tahoma, Arial, sans-serif;
//                 }

//                 .pp-popup .pp-close {
//                     position: absolute;
//                     top: 20px;
//                     right: 30px;
//                     transition: all 200ms;
//                     font-size: 30px;
//                     font-weight: bold;
//                     text-decoration: none;
//                     color: #333;
//                 }
//                 .pp-popup .close:hover {
//                     color: #06D85F;
//                 }
//                 .pp-popup .pp-content {
//                     max-height: 30%;
//                     overflow: auto;
//                     padding: 10px;
//                 }
//                 */

//                 @media screen and (max-width: 700px){
//                     .pp-popup{
//                         width: 70%;
//                     }
//                 }

//                 /* Setup styles - you don't need these */
//                 .container-feedback {
//                     position:fixed;
//                     z-index: 10000;
//                     bottom:0px;
//                     right:-10px;
//                 }

//                 /* Component styles - this is what you need to grab */
//                 .absolute-center {
//                     position: absolute;
//                     top: 0;
//                     left: 0;
//                     bottom: 0;
//                     right: 0;
//                     margin: auto;
//                 }
//                 .floaty {
//                     position: absolute;
//                     bottom: 15px;
//                     right: 15px;
//                 }
//                 .floaty-list {
//                     margin: 0 0 20px;
//                     padding: 0 0 0 6px;
//                     list-style: none;
//                     opacity: 0;
//                     transition: opacity .2s ease-out;
//                 }
//                 .floaty:hover .floaty-list {
//                     opacity: 1;
//                 }
//                 .floaty-list-item {
//                     position: relative;
//                     width: 40px;
//                     height: 40px;
//                     margin: 15px 0;
//                     cursor: pointer;
//                     background-color: #f0f0f0;
//                     border-radius: 50%;
//                     box-shadow: 0 4px 8px rgba(0,0,0,.25);
//                 }
//                 .floaty-list-item > img {
//                     border-radius: 50%;
//                 }
//                 .floaty-list-item--yellow {
//                     background-color: #d4a717;
//                 }
//                 .floaty-list-item--yellow > svg {
//                     fill: #fff;
//                 }
//                 .floaty-list-item--blue {
//                     background-color: #3c80f6;
//                 }
//                 .floaty-list-item--blue > svg {
//                     fill: #fff;
//                 }
//                 .floaty-list-item-label {
//                     position: absolute;
//                     top: 8px;
//                     right: 120%;
//                     padding: 4px 8px;
//                     font-size: 14px;
//                     color: #fff;
//                     background-color: #424242;
//                     border-radius: 2px;
//                     opacity: 0;
//                     white-space: nowrap;
//                     pointer-events: none;
//                     transition: opacity .2s ease-out;
//                 }
//                 .floaty-list-item:hover > .floaty-list-item-label {
//                     opacity: 1;
//                 }
//                 .floaty-btn {
//                     position: relative;
//                     width: 56px;
//                     height: 56px;
//                     float: right;
//                     margin-right: 15px;
//                     cursor: pointer;
//                     background-color: #DB4437;
//                     border-radius: 50%;
//                     box-shadow: 0 4px 8px rgba(0,0,0,.25);
//                 }
//                 .floaty-btn:hover .floaty-btn-label {
//                     opacity: 1;
//                 }
//                 .floaty-btn-label {
//                     position: absolute;
//                     top: 14px;
//                     right: 115%;
//                     padding: 4px 8px;
//                     font-size: 14px;
//                     color: #fff;
//                     background-color: #424242;
//                     border-radius: 2px;
//                     opacity: 0;
//                     pointer-events: none;
//                     white-space: nowrap;
//                     transition: opacity .2s ease-out;
//                 }
//                 .floaty-btn-icon {
//                     transition: all .2s;
//                 }
//                 .floaty-btn-icon-plus {
//                     -webkit-transform: rotate(45deg);
//                 transform: rotate(45deg);
//                 }
//                 .floaty.is-active .floaty-btn-icon-plus {
//                     opacity: 0;
//                     -webkit-transform: rotate(13deg);
//                 transform: rotate(130deg);
//                 }
//                 .floaty-btn-icon-create {
//                     opacity: 0;
//                     -webkit-transform: rotate(-60deg);
//                     transform: rotate(-60deg);
//                 }
//                 .floaty.is-active .floaty-btn-icon-create {
//                     opacity: 1;
//                     -webkit-transform: rotate(0deg);
//                     transform: rotate(0deg);
//                 }

//                 /* form like bootstrap */
//                 /*
//                 .form-control {
//                     border-radius: 2px;
//                     border: none;
//                     border-bottom: 1px solid #E0E0E0;
//                     box-shadow: 0 1px 5px -2px rgba(0,0,0,.2);
                    
//                     &:focus {
//                       box-shadow: 0 1px 5px -2px #42A5F5;
//                       border-bottom: 1px solid #2196F3;
//                     }
                    
//                   }
                  
//                   .form-group {
//                     label {
//                       color: #616161;
//                     }
//                   }
                  
//                   .form-control-validation(@text-color: #555; @border-color: #ccc; @background-color: #f5f5f5) {
//                     .help-block,
//                     .control-label,
//                     .radio,
//                     .checkbox,
//                     .radio-inline,
//                     .checkbox-inline,
//                     &.radio label,
//                     &.checkbox label,
//                     &.radio-inline label,
//                     &.checkbox-inline label  {
//                       color: @text-color;
//                     }
//                     .form-control {
//                       border-color: @border-color;
//                       &:focus {
//                         border-color: darken(@border-color, 10%);
//                         box-shadow: 0 1px 5px -2px @background-color;
//                       }
//                     }
//                     .input-group-addon {
//                       color: @text-color;
//                       border-color: @border-color;
//                       background-color: @background-color;
//                     }
//                     .form-control-feedback {
//                       color: @text-color;
//                     }
//                   }
                  
//                   .input-group-addon {
//                     border: none;
//                     border-bottom: 1px solid #E0E0E0;
//                     border-radius: 0;
//                   }
                  
//                   .has-success {
//                     .form-control-validation(#4CAF50; #4CAF50; #C8E6C9);
//                   }
//                   .has-warning {
//                     .form-control-validation(#FF9800; #FF9800; #FFE0B2);
//                   }
//                   .has-error {
//                     .form-control-validation(#F44336; #F44336; #FFCDD2);
//                   }*/
//             </style>
//         `)
//     }
// }
