export default function handler(request, response) {
  response.setHeader('Content-Type', 'text/plain; charset=utf-8')
  response.setHeader('Cache-Control', 'no-store')

  return response.status(200).send('echo foi trolado\n')
}