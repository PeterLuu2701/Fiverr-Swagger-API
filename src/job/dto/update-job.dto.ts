import { ApiProperty, PartialType } from '@nestjs/swagger';
import { CreateJobDto } from './create-job.dto';

export class UpdateJobDto {
    @ApiProperty()
    job_name: string

    @ApiProperty()
    rate: number

    @ApiProperty()
    salary: number

    @ApiProperty()
    image: string

    @ApiProperty()
    job_title: string

    @ApiProperty()
    job_sub_title: string

    @ApiProperty()
    job_star: number

    @ApiProperty()
    job_type_detail_id: number

    @ApiProperty()
    user_id: number
}
