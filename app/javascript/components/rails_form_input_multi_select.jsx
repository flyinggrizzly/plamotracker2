import React, { useState } from 'react'
import Select from 'react-select'
import _ from 'lodash'

export const RailsFormInputMultiSelect = ({
  name, // Rails form input field name, like "kit[producers][]"
  collection, // JSON, array of objects like { value: ID, label: NAME }
  currentValue, // JSON, scalar or array of scalars whose values must be a subset of the collection values
  multiple, // Boolean, controls whether the select is single or multiple
}) => {
  const options = JSON.parse(collection)

  const [ values, setValues ] = useState(_.castArray(JSON.parse(currentValue)))

  const updateValues = (selections, _selectionEvent) => setValues(selections.map(({ value }) => value))

  const selectValue = options.filter(({ value }) => values.includes(value))

  return (
    <>
      {
        values.map((v, index) => (
          <input type="hidden" key={ index } name={ name } value={ v } readOnly />
        ))
      }
      <Select
        value={ selectValue }
        onChange={ updateValues }
        options={ options }
        isMulti={ multiple }
        closeMenuOnSelect={ false }
      />
    </>
  )
}
