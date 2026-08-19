export default function handler(request, response) {
  response.setHeader('Content-Type', 'text/plain; charset=utf-8')
  response.setHeader('Cache-Control', 'no-store')

  const script = `${Array.from({ length: 50 }, () => 'echo foi trolado').join('\n')}\n`

  return response.status(200).send(script)
}