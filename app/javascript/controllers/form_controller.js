// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
//
// Implemented using the following article
// https://www.mikewilson.dev/posts/client-side-form-validation-with-stimulus-and-rails/
//
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['form'];

  submitForm(event) {
    const isValid = this.validateForm(this.formTarget);

    // If our form is invalid, prevent default on the event
    // so that the form is not submitted
    if (!isValid) {
      event.preventDefault();
    }
  }

  // TODO: Look at this with fresh eyes
  validateForm() {
    let isValid = true;

    const inputs = this.formTarget.querySelectorAll('input');

    const radioInputs = [];

    inputs.forEach(input => {
      // Validate a radio button has 
      // Been selected 
      if (input.type == "radio") {
        radioInputs.push(input);
      }

      if (input.type != "text" && input.type != "hidden") {
        return;
      }

      if (input.value === '') {
        hideValidationError(false, input.id);
        isValid = false; 
      } else {
        hideValidationError(true, input.id);
      }

      if (input.id === "posting_how_to_apply" || input.id === "service_how_to_contact") {
        if ( !validateEmail(input.value) && !validURL(input.value) ) {
          hideValidationError(false, input.id);
          isValid = false; 
        } 
      }
    });

    // if no inputs are present on form, do not validate
    if (radioInputs.length > 0) {

      // if no inputs were checked, form is not valid
      if (!radioInputs.map(i => i.checked).includes(true)) {
        hideValidationError(false, 'checkbox-validation');
        isValid = false;
      }
    }

    return isValid;
  }
}

// Helpers //

/*
* Helper to Hide/Show validation errors
* false - validation error is shown
* true - validation error is hidden
*/
function hideValidationError(bool, input_id) {
  // Find the associated validation div
  // This div uses the input.id as its classname
  const validationDiv = document.getElementsByClassName(input_id)[0];

  if (validationDiv) {
    validationDiv.hidden = bool;
  }
}

/*
* Check for valid email
*/
function validateEmail(email) {
  const re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  return re.test(String(email).toLowerCase());
}

/*
* TODO: Change/Improve this
* Check for valid URL
* https://stackoverflow.com/questions/5717093/check-if-a-javascript-string-is-a-url
*/
function validURL(str) {
  var pattern = new RegExp('^(https?:\\/\\/)?'+ // protocol
    '((([a-z\\d]([a-z\\d-]*[a-z\\d])*)\\.)+[a-z]{2,}|'+ // domain name
    '((\\d{1,3}\\.){3}\\d{1,3}))'+ // OR ip (v4) address
    '(\\:\\d+)?(\\/[-a-z\\d%_.~+]*)*'+ // port and path
    '(\\?[;&a-z\\d%_.~+=-]*)?'+ // query string
    '(\\#[-a-z\\d_]*)?$','i'); // fragment locator
  return !!pattern.test(str);
}
