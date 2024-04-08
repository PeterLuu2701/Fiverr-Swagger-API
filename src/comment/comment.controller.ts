import { Controller, Get, Post, Body, Patch, Param, Delete, Put, UseGuards } from '@nestjs/common';
import { CommentService } from './comment.service';
import { CreateCommentDto } from './dto/create-comment.dto';
import { UpdateCommentDto } from './dto/update-comment.dto';
import { ApiBearerAuth, ApiBody, ApiProperty, ApiTags } from '@nestjs/swagger';
import { AuthGuard } from '@nestjs/passport';

class commentType {
  @ApiProperty()
  job_id: number

  @ApiProperty()
  user_id: number

  @ApiProperty()
  comment_date: Date

  @ApiProperty()
  content: string

  @ApiProperty()
  comment_star: number
}

@ApiTags('comment')
@Controller('comment')
export class CommentController {
  constructor(private readonly commentService: CommentService) {}

  @ApiBearerAuth()
  @UseGuards(AuthGuard('jwt'))
  @ApiBody({ type: commentType })
  @Post('create-comment')
  create(@Body() comment: commentType) {
    return this.commentService.create(comment);
  }

  @Get('get-all-comments')
  findAll() {
    return this.commentService.findAll();
  }

  @Get('get-comment-by-job-id/:id')
  findOne(@Param('id') id: string) {
    return this.commentService.findOne(+id);
  }

  @ApiBearerAuth()
  @UseGuards(AuthGuard('jwt'))
  @Patch('update-comment-by-id/:id')
  update(@Param('id') id: string, @Body() updateCommentDto: UpdateCommentDto) {
    return this.commentService.update(+id, updateCommentDto);
  }

  @ApiBearerAuth()
  @UseGuards(AuthGuard('jwt'))
  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.commentService.remove(+id);
  }
}
