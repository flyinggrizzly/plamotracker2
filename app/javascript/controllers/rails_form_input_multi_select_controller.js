import { Controller } from "@hotwired/stimulus"
import React from 'react'
import { createRoot } from 'react-dom/client'

import { RailsFormInputMultiSelect } from 'components/rails_form_input_multi_select'


export default class RailsFormInputMultiSelectController extends Controller {
  connect() {
    const { name, collection, currentValue } = this.element.dataset

    import('components/rails_form_input_multi_select').then(module => {
      const RailsFormInputMultiSelect = module.RailsFormInputMultiSelect

      const root = createRoot(this.element)

      root.render(
        <RailsFormInputMultiSelect
          name={ name }
          collection={ collection }
          currentValue={ currentValue }
        />
      )
    })
  }
}
