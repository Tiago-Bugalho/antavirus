const button = document.querySelector('#troll-button')
const output = document.querySelector('#response-output code')
const state = document.querySelector('#request-state')

button.addEventListener('click', async () => {
  button.disabled = true
  state.textContent = 'fazendo requisição...'
  output.textContent = '{\n  "message": "..."\n}'

  try {
    const response = await fetch('/api/troll')
    if (!response.ok) throw new Error(`HTTP ${response.status}`)
    const data = await response.json()
    output.textContent = JSON.stringify(data, null, 2)
    state.textContent = 'requisição concluída'
  } catch (error) {
    output.textContent = JSON.stringify({ error: 'Não foi possível alcançar a função.', detail: error.message }, null, 2)
    state.textContent = 'erro na requisição'
  } finally {
    button.disabled = false
  }
})