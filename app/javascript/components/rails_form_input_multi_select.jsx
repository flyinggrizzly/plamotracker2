import React, { useState } from 'react'
import Select from 'react-select'

export const RailsFormInputMultiSelect = ({
  name, // Rails form input field name, like "kit[producers][]"
  collection, // JSON, array of objects like { value: ID, label: NAME }
  currentValue, // JSON, array of scalars whose values must be a subset of the collection values
}) => {
  const options = JSON.parse(collection)

  const [ values, setValues ] = useState(JSON.parse(currentValue))

  const updateValues = (selections, _selectionEvent) => setValues(selections.map(({ value }) => value))

  const selectValue = options.filter(({ value }) => values.includes(value))

  return (
    <>
      <input type="hidden" name={ name } value={ values.join(',') } readOnly />
      <Select
        value={ selectValue }
        onChange={ updateValues }
        options={ options }
        isMulti
        closeMenuOnSelect={ false }
      />
    </>
  )
}
