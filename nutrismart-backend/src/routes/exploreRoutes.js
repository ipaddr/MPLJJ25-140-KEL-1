const express = require('express');
const router = express.Router();
const exploreController = require('../controllers/exploreController');
const auth = require('../middleware/auth');  // Middleware autentikasi
const roleCheck = require('../middleware/roleCheck');  // Middleware pengecekan peran

/**
 * @swagger
 * tags:
 *   name: Explore
 *   description: Educational content management
 * 
 * components:
 *   schemas:
 *     Explore:
 *       type: object
 *       properties:
 *         title:
 *           type: string
 *         content:
 *           type: string
 *         type:
 *           type: string
 *           enum: [article, video]
 *         thumbnailUrl:
 *           type: string
 *         tags:
 *           type: array
 *           items:
 *             type: string
 * 
 * /api/explore:
 *   post:
 *     summary: Create new educational content
 *     tags: [Explore]
 *     security:
 *       - BearerAuth: []
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/Explore'
 *     responses:
 *       201:
 *         description: Content created successfully
 *       401:
 *         description: Unauthorized
 *       500:
 *         description: Server Error
 */
// Rute untuk menambah konten edukasi (artikel/video)
router.post('/add', auth, roleCheck('admin'), exploreController.createExploreContent);

/**
 * @swagger
 * /api/explore:
 *   get:
 *     summary: Get all educational content
 *     tags: [Explore]
 *     security:
 *       - BearerAuth: []
 *     responses:
 *       200:
 *         description: Success retrieving educational content
 *       401:
 *         description: Unauthorized
 *       500:
 *         description: Server Error
 */
// Rute untuk mengambil seluruh konten edukasi
router.get('/', auth, exploreController.getExploreContent);

/**
 * @swagger
 * /api/explore/{id}:
 *   get:
 *     summary: Get educational content by ID
 *     tags: [Explore]
 *     security:
 *       - BearerAuth: []
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         description: The ID of the educational content
 *         schema:
 *           type: string
 *     responses:
 *       200:
 *         description: Success retrieving educational content
 *       401:
 *         description: Unauthorized
 *       404:
 *         description: Content not found
 *       500:
 *         description: Server Error
 */
// Rute untuk mengambil konten edukasi berdasarkan ID
router.get('/:id', auth, exploreController.getExploreContentById);

/**
 * @swagger
 * /api/explore/{id}:
 *   put:
 *     summary: Update educational content by ID
 *     tags: [Explore]
 *     security:
 *       - BearerAuth: []
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         description: The ID of the educational content
 *         schema:
 *           type: string
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/Explore'
 *     responses:
 *       200:
 *         description: Content updated successfully
 *       401:
 *         description: Unauthorized
 *       404:
 *         description: Content not found
 *       500:
 *         description: Server Error
 */
// Rute untuk memperbarui konten edukasi berdasarkan ID
router.put('/:id', auth, roleCheck('admin'), exploreController.updateExploreContent);

/**
 * @swagger
 * /api/explore/{id}:
 *   delete:
 *     summary: Delete educational content by ID
 *     tags: [Explore]
 *     security:
 *       - BearerAuth: []
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         description: The ID of the educational content
 *         schema:
 *           type: string
 *     responses:
 *       204:
 *         description: Content deleted successfully
 *       401:
 *         description: Unauthorized
 *       404:
 *         description: Content not found
 *       500:
 *         description: Server Error
 */
// Rute untuk menghapus konten edukasi berdasarkan ID
router.delete('/:id', auth, roleCheck('admin'), exploreController.deleteExploreContent);

module.exports = router;
