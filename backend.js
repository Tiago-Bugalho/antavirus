export default function handler(request, response) {
	response.setHeader('Content-Type', 'application/json; charset=utf-8')
	response.setHeader('Cache-Control', 'no-store')

	return response.status(200).json({
		message: 'echo foi trolado',
		method: request.method,
		timestamp: new Date().toISOString(),
	})
}