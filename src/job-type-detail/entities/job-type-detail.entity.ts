import { ApiProperty } from "@nestjs/swagger";

export class JobTypeDetail {}

export class FileUploadDto {
    @ApiProperty({ type: 'string', format: 'binary' })
    file: any;
}